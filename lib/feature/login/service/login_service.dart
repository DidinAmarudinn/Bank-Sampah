import 'dart:convert';
import 'dart:io';

import 'package:bank_sampah/feature/login/model/login_model.dart';
import 'package:bank_sampah/core/base_response.dart';
import 'package:bank_sampah/utils/exception.dart';
import 'package:bank_sampah/utils/failure.dart';
import 'package:dartz/dartz.dart';
import "package:http/http.dart" as http;

import '../../../utils/api_constants.dart';

class LoginService {
  Future<Either<Failure, BaseResponse<LoginModel>?>> login(
      String username, String password) async {
    try {
      var map = <String, String>{};
      map['user_login'] = username;
      map['password_login'] = password;
      var request = http.MultipartRequest("POST", Uri.parse(loginUrl));
      request.fields.addAll(map);
      var reqResponse = await request.send();
      if (reqResponse.statusCode == 200) {
        var response = await http.Response.fromStream(reqResponse);
        var res = json.decode(response.body);
        if (res["status"] == "true") {
          final result = BaseResponse<LoginModel>.fromJson(
              res, (data) => LoginModel.fromJson(data));
          return Right(result);
        } else {
          return Left(ServerFailure(res["result"].toString()));
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
}