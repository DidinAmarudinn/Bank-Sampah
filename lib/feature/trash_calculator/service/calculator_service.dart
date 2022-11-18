import 'dart:convert';
import 'dart:io';

import 'package:bank_sampah/feature/trash_calculator/model/trash_model.dart';
import 'package:bank_sampah/utils/api_constants.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../core/base_response_list.dart';
import '../../../utils/exception.dart';
import '../../../utils/failure.dart';

class CalculatorService {
  Future<Either<Failure, BaseResponseList<TrashModel>?>> getListTrash() async {
    try {
      final response = await http.get(Uri.parse(getTrashListUrl));
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        print(response.body);
        if (data["status"] == "true") {
          final result = BaseResponseList<TrashModel>.fromJson(data, (data) {
            List<TrashModel> trashs =
                data.map((e) => TrashModel.fromJson(e)).toList();
            return trashs;
          });
          return Right(result);
        } else {
          return Left(ServerFailure(data["result"].toString()));
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
