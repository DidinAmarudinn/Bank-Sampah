import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class LoginModel {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'nama_user')
  String? namaUser;
  @JsonKey(name: "level")
  String? level;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "filefotoprofile")
  String? filefotoprofile;
  @JsonKey(name: "id_group")
  String? idGroup;

  LoginModel(
      {this.id,
      this.namaUser,
      this.level,
      this.status,
      this.username,
      this.filefotoprofile,
      this.idGroup});
  factory LoginModel.fromJson(Map<String, dynamic>json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
