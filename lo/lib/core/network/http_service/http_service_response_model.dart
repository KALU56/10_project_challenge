class HttpServiceResponseModel {
  final dynamic data;
  final int? statusCode;
  final String? message;
  final bool success;

  HttpServiceResponseModel({
    this.data,
    this.statusCode,
    this.message,
    required this.success,
  });

  factory HttpServiceResponseModel.success(dynamic data, int statusCode) {
    return HttpServiceResponseModel(
      data: data,
      statusCode: statusCode,
      success: true,
    );
  }

  factory HttpServiceResponseModel.error(String message, [int? statusCode]) {
    return HttpServiceResponseModel(
      message: message,
      statusCode: statusCode,
      success: false,
    );
  }
}
