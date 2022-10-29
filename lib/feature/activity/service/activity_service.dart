import 'dart:convert';
import 'dart:io';

import 'package:bank_sampah/feature/activity/model/activity_model.dart';
import 'package:bank_sampah/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../utils/api_constants.dart';
import '../../../utils/exception.dart';

class ActivityService {
  Future<Either<Failure, ActivityModel?>> getActivityList(
      int record, int recordPerPage) async {
    try {
      var map = <String, String>{};
      map['record'] = "$record";
      map["recordPerPage"] = "$recordPerPage";
      var request =
          http.MultipartRequest("POST", Uri.parse(getListActivityUrl));
      request.fields.addAll(map);
      var reqResponse = await request.send();

      if (reqResponse.statusCode == 200) {
        var response = await http.Response.fromStream(reqResponse);
        var res = json.decode(response.body);
        if (res["status"] == "true") {
          try {
            final result = ActivityModel.fromJson(res);
            return Right(result);
          } catch (e) {
            return Left(ServerFailure(res["result"].toString()));
          }
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

  Future<Either<Failure, ActivityModel?>> getListArticle(
      int record, int recordPerPage) async {
    try {
      var map = <String, String>{};
      map['record'] = "$record";
      map["recordPerPage"] = "$recordPerPage";
      var request = http.MultipartRequest("POST", Uri.parse(getListArticleUrl));
      request.fields.addAll(map);
      var reqResponse = await request.send();

      if (reqResponse.statusCode == 200) {
        var response = await http.Response.fromStream(reqResponse);
        var res = json.decode(response.body);
        if (res["status"] == "true") {
          try {
            final result = ActivityModel.fromJson(res);
            return Right(result);
          } catch (e) {
            return Left(ServerFailure(res["result"].toString()));
          }
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

  Future<Either<Failure, bool>> addCountOfView(int id) async {
    try {
      var request =
          http.MultipartRequest("POST", Uri.parse("$addCountOfViewUrl$id"));
      var reqResponse = await request.send();

      if (reqResponse.statusCode == 200) {
        var response = await http.Response.fromStream(reqResponse);
        var res = json.decode(response.body);

        if (res["status"] == "true") {
          try {
            return const Right(true);
          } catch (e) {
            return Left(ServerFailure(res["result"].toString()));
          }
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
