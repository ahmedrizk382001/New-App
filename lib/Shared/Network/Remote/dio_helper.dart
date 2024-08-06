import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> get(String method, Map<String, dynamic> query) async {
    return await dio.get(
      method,
      queryParameters: query,
    );
  }
}
