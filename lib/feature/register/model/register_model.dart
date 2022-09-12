class GroupModel {
  String? status;
  List<Result>? result;

  GroupModel({this.status, this.result});

  GroupModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? id;
  String? level;
  String? deskripsi;
  String? statusDaftar;
  String? hakAkses;

  Result(
      {this.id, this.level, this.deskripsi, this.statusDaftar, this.hakAkses});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    deskripsi = json['deskripsi'];
    statusDaftar = json['status_daftar'];
    hakAkses = json['hak_akses'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['level'] = level;
    data['deskripsi'] = deskripsi;
    data['status_daftar'] = statusDaftar;
    data['hak_akses'] = hakAkses;
    return data;
  }
}
