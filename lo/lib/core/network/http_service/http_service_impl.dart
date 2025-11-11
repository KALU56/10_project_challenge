import 'package:dio/dio.dart';
import 'http_service.dart';
import 'http_service_response_model.dart';

class DioHttpService implements HttpService {
  final Dio _dio;

  DioHttpService({Dio? dio})
      : _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: 'https://api.example.com/',
                connectTimeout: const Duration(seconds: 15),
                receiveTimeout: const Duration(seconds: 15),
                headers: {
                  'Content-Type': 'application/json',
                },
              ),
            );

  @override
  Future<HttpServiceResponseModel> get(String url, {Map<String, String>? headers}) async {
    try {
      final response = await _dio.get(url, options: Options(headers: headers));
      return HttpServiceResponseModel.success(response.data, response.statusCode ?? 200);
    } on DioException catch (e) {
      return HttpServiceResponseModel.error(_extractError(e), e.response?.statusCode);
    }
  }

  @override
  Future<HttpServiceResponseModel> post(String url, dynamic data, {Map<String, String>? headers}) async {
    try {
      final response = await _dio.post(url, data: data, options: Options(headers: headers));
      return HttpServiceResponseModel.success(response.data, response.statusCode ?? 200);
    } on DioException catch (e) {
      return HttpServiceResponseModel.error(_extractError(e), e.response?.statusCode);
    }
  }

  @override
  Future<HttpServiceResponseModel> put(String url, dynamic data, {Map<String, String>? headers}) async {
    try {
      final response = await _dio.put(url, data: data, options: Options(headers: headers));
      return HttpServiceResponseModel.success(response.data, response.statusCode ?? 200);
    } on DioException catch (e) {
      return HttpServiceResponseModel.error(_extractError(e), e.response?.statusCode);
    }
  }

  @override
  Future<HttpServiceResponseModel> delete(String url, {Map<String, String>? headers}) async {
    try {
      final response = await _dio.delete(url, options: Options(headers: headers));
      return HttpServiceResponseModel.success(response.data, response.statusCode ?? 200);
    } on DioException catch (e) {
      return HttpServiceResponseModel.error(_extractError(e), e.response?.statusCode);
    }
  }

  String _extractError(DioException e) {
    if (e.response?.data is Map && e.response?.data['message'] != null) {
      return e.response?.data['message'];
    }
    return e.message ?? 'Unexpected network error';
  }
}
