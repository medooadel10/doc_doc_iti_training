import 'package:dio/dio.dart';
import 'package:docdoc_app/core/networking/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static late Dio dio;
  static void init() async {
    const timeout = const Duration(seconds: 120);
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: timeout,
        receiveTimeout: timeout,
        sendTimeout: timeout,
      ),
    )..interceptors.add(PrettyDioLogger(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
      ));
  }

  static Future<Response> postData({
    required String path,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    final response = await dio.post(
      path,
      data: data,
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );
    return response;
  }

  static Future<Response> getData({
    required String path,
    String? token,
  }) async {
    final response = await dio.get(
      path,
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );
    return response;
  }

  static Future<Response> deleteData({
    required String path,
    String? token,
  }) async {
    final response = await dio.delete(
      path,
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );
    return response;
  }
}
