import 'dart:convert';
import 'dart:io';

import 'package:bank_sampah/feature/register/model/register_model.dart';
import 'package:dartz/dartz.dart';

import '../../../utils/api_constants.dart';
import '../../../utils/exception.dart';
import '../../../utils/failure.dart';
import 'package:http/http.dart' as http;

class RegisterService {
  Future<Either<Failure, bool>> register(String username, String password,
      String name, String email, String noTelp, String idGroup) async {
    try {
      var map = <String, String>{};
      map['username'] = username;
      map["nama_user"] = name;
      map["no_telp"] = noTelp;
      map["id_group"] = idGroup;
      map['password'] = password;
      map["email"] = email;
      var request = http.MultipartRequest("POST", Uri.parse(registerUrl));
      request.fields.addAll(map);
      var reqResponse = await request.send();
      if (reqResponse.statusCode == 200) {
        var response = await http.Response.fromStream(reqResponse);
        var data = json.decode(response.body);
        if (data["status"] == "true") {
          return const Right(true);
        } else {
          return Left(ServerFailure(data["result"]["error_string"]
              .toString()
              .replaceAll("]", "")
              .replaceAll("[", "")));
        }
      } else {
        throw ServerException();
      }
    } on ServerException {
      return Left(ServerFailure("Internal Server Error"));
    } on SocketException {
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }

  Future<GroupModel?> getGroupId() async {
    final response = await http.get(Uri.parse(getGroupUrl));
    var data = json.decode(response.body);
    if (data["status"] == "true") {
      return GroupModel.fromJson(data);
    } else {
      return null;
    }
  }
}
