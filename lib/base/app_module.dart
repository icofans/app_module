import 'package:app_module/api/api.dart';
import 'package:app_module/common/sp.dart';
import 'package:app_module/viewmodel/login_provide.dart';
import 'package:dartin/dartin.dart';

const testScope = DartInScope('test');

/// ViewModel 模块
///
/// 定义ViewModel的构造方式
final viewModelModule = Module([
  factory<LoginProvide>(({params}) => LoginProvide()),
])
  ..withScope(testScope, [
    ///other scope
//  factory<HomeProvide>(({params}) => HomeProvide(params.get(0), get<GithubRepo>())),
  ]);

/// api接口
Api api = Api.instance;

/// api 模块
///
/// api 的构造方式
final apiModule = Module([
  single<Api>(({params}) => api),
]);

/// 本地sp存储
SpUtil spUtil;

/// Local 模块
///
/// 定义数据库层及SharedPreference/KV等等本地存储的构造方式
final localModule = Module([
  single<SpUtil>(({params}) => spUtil),
]);

final appModule = [viewModelModule, apiModule, localModule];

/// init
///
/// 初始化 [spUtil] 并启动[DartIn]
init() async {
  spUtil = await SpUtil.getInstance();
  // DartIn start
  startDartIn(appModule);
}
