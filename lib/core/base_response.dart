class BaseResponse<T> {
  String? status;
  T? data;

  BaseResponse({
    this.status,
    this.data,
  });

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) fromJsonT) {
    return BaseResponse<T>(
        status: json["status"], data: fromJsonT(json["result"]));
  }
}
