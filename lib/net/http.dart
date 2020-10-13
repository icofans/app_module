import 'dart:async';
import 'dart:convert';

import 'package:app_module/config/config.dart';
import 'package:app_module/net/base_entity.dart';
import 'package:app_module/net/error_handle.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

typedef SuccessCallback = void Function(dynamic json);
typedef ErrorCallback = void Function(int code, String reason);
typedef CompletionCallback = void Function();

enum Method { get, post, put, patch, delete, head }

extension MethodExtension on Method {
  String get value => ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'HEAD'][index];
}

/// 网络请求
final _dio = Dio()
  ..options = BaseOptions(
    baseUrl: Config.instance.baseUrl,
    connectTimeout: 5000,
    receiveTimeout: 3000,
    responseType: ResponseType.json,
  )
  // ..interceptors.add(CookieManager(CookieJar()))
  ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true))
  ..interceptors.add(
    InterceptorsWrapper(onRequest: (RequestOptions options) {
      return options;
    }, onResponse: (Response response) {
      return response;
    }, onError: (DioError e) async {
      return e;
    }),
  );

// 请求处理
Future _request(
  String method,
  String url, {
  dynamic data,
  Map<String, dynamic> queryParameters,
  CancelToken cancelToken,
  Options options,
}) {
  Completer completer = new Completer();
  _dio
      .request(url,
          data: data,
          queryParameters: queryParameters,
          options: _checkOptions(method, options),
          cancelToken: cancelToken)
      .then((response) {
    try {
      final String data = response.data.toString();
      compute(_parseData, data).then((value) {
        BaseEntity result = BaseEntity.fromJson(value);
        if (result.code == 0) {
          completer.complete(result.data);
        } else {
          completer.completeError(
              ResponseError(result.code, result.message ?? "未知错误"));
        }
      });
    } catch (e) {
      return BaseEntity(ErrorHandle.parse_error, '数据解析错误！', null);
    }
  }, onError: (dynamic e) {
    final RequestError error = ErrorHandle.handleException(e);
    completer.completeError(error);
  });

  return completer.future;
}

Options _checkOptions(String method, Options options) {
  options ??= Options();
  options.method = method;
  return options;
}

Map<String, dynamic> _parseData(String data) {
  return json.decode(data) as Map<String, dynamic>;
}

/// 网络请求-get
///
Stream get(String url, {Map<String, dynamic> params}) {
  return Stream.fromFuture(_request(
    Method.get.value,
    url,
    data: params,
  )).asBroadcastStream();
}

/// 网络请求-post
///
Stream post(String url, {Map<String, dynamic> params}) {
  return Stream.fromFuture(_request(
    Method.post.value,
    url,
    data: params,
  )).asBroadcastStream();
}
