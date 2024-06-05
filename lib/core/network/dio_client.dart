import 'package:cocktail_flutter_app/core/network/api_config.dart';
import 'package:dio/dio.dart';

class DioClient {
  static Dio getDio({
    String baseUrl = ApiConfig.baseUrl,
    List<Interceptor>? interceptors,
    Map<String, dynamic>? headers,
    int timeout = ApiConfig.connectTimeout,
  }) {
    final dio = Dio()
      ..options = BaseOptions(
        baseUrl: baseUrl = ApiConfig.baseUrl,
        headers: headers = {'Content-Type': 'application/json; charset=UTF-8'},
        connectTimeout: Duration(milliseconds: timeout),
        sendTimeout: Duration(milliseconds: timeout),
        receiveTimeout: Duration(milliseconds: timeout),
      );
    return dio;
  }
}
