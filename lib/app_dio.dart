import 'package:dio/native_imp.dart';

class AppDio extends DioForNative {
  static AppDio _instance;

  AppDio._();

  factory AppDio() {
    if (_instance == null) {
      _instance = AppDio._();
    }
    return _instance;
  }
}
