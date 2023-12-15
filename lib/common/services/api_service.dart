import 'package:dio/dio.dart';
import 'package:task_for_job/common/constants/api_const.dart';

enum Method { get, post, put, delete }

class ApiService {
  final Dio _dio;

  ApiService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: ApiConst.baseUrl,
            connectTimeout: const Duration(seconds: 20),
            receiveTimeout: const Duration(seconds: 20),
            sendTimeout: const Duration(seconds: 20),
          ),
        );

  Future<Response<T>> request<T>({
    String? path,
    Method method = Method.get,
    Map<String, Object?>? queryParams,
    Map<String, Object?>? headers,
    Map<String, Object?>? body,
  }) async {
    return _dio.request<T>(
      path ?? "",
      queryParameters: queryParams,
      data: body,
      options: Options(
        headers: headers,
        method: method.name.toUpperCase(),
      ),
    );
  }
}

