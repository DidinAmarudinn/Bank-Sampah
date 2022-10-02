class BaseResponseList<T> {
  String? status;
  List<T>? data;

  BaseResponseList({
    this.status,
    this.data,
  });

  factory BaseResponseList.fromJson(
      Map<String, dynamic> json, Function(List<dynamic>) fromJsonT) {
    return BaseResponseList<T>(
        status: json["status"], data: fromJsonT(json["result"]));
  }
}
