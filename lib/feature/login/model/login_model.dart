class LoginModel {
  String? status;
  LoginResult? result;

  LoginModel({this.status, this.result});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result =
        json['result'] != null ? LoginResult.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class LoginResult {
  String? id;
  String? namaUser;
  String? level;
  String? status;
  String? username;
  String? filefotoprofile;
  String? idGroup;

  LoginResult(
      {this.id,
      this.namaUser,
      this.level,
      this.status,
      this.username,
      this.filefotoprofile,
      this.idGroup});

  LoginResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaUser = json['nama_user'];
    level = json['level'];
    status = json['status'];
    username = json['username'];
    filefotoprofile = json['filefotoprofile'];
    idGroup = json['id_group'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama_user'] = namaUser;
    data['level'] = level;
    data['status'] = status;
    data['username'] = username;
    data['filefotoprofile'] = filefotoprofile;
    data['id_group'] = idGroup;
    return data;
  }
}
