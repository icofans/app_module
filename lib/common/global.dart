class Global {
  /// 接口实现类,单利化
  // 工厂模式
  factory Global() => _getInstance();
  static Global get instance => _getInstance();
  static Global _instance;

  static Global _getInstance() {
    if (_instance == null) {
      _instance = new Global._internal();
    }
    return _instance;
  }

  // 初始化 方法
  Global._internal() {}
}
