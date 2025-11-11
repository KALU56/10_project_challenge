import 'http_service_response_model.dart';

abstract interface class HttpService {
  Future<HttpServiceResponseModel> get(String url, {Map<String, String>? headers});
  Future<HttpServiceResponseModel> post(String url, dynamic data, {Map<String, String>? headers});
  Future<HttpServiceResponseModel> put(String url, dynamic data, {Map<String, String>? headers});
  Future<HttpServiceResponseModel> delete(String url, {Map<String, String>? headers});
}