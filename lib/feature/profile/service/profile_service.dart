import 'dart:convert';
import 'dart:io';

import 'package:bank_sampah/feature/profile/model/others_info_model.dart';
import 'package:bank_sampah/feature/profile/model/update_data_request.dart';
import 'package:bank_sampah/utils/api_constants.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../core/base_response.dart';
import '../../../utils/exception.dart';
import '../../../utils/failure.dart';

class ProfileService {
  Future<Either<Failure, bool>> updateProfile(
      UpdateDataRequest updateDataRequest, String idNasabah) async {
    try {
      var request = http.MultipartRequest("POST", Uri.parse(updateProfileUrl));
      request.fields.addAll({
        'id_user_nasabah': idNasabah,
        'id_jenis': updateDataRequest.idJenis,
        'id_kecamatan': updateDataRequest.idKecamatan,
        'id_kelurahan': updateDataRequest.idKelurahan,
        'nama_nasabah': updateDataRequest.namaNasabah,
        'no_kontak': updateDataRequest.noKontak,
        'email': updateDataRequest.email,
        'alamat': updateDataRequest.alamat
      });
      var reqResponse = await request.send();
      if (reqResponse.statusCode == 200) {
        var response = await http.Response.fromStream(reqResponse);
        var res = json.decode(response.body);
        if (res["status"] == "true") {
          return const Right(true);
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

  Future<Either<Failure, BaseResponse<OthersInfoModel>?>> getOthersInfo() async {
    try {
      final response = await http.post(Uri.parse(getOthersInfoUrl));
      if (response.statusCode == 200) {
        var res = json.decode(response.body);
        if (res["status"] == "true") {
          return Right(BaseResponse.fromJson(
              res, (data) => OthersInfoModel.fromJson(data)));
        } else {
          return const Right(null);
        }
      } else {
        return Left(ServerFailure("Internal Server Error"));
      }
    } on ServerException {
      return Left(ServerFailure("Internal Server Error"));
    } on SocketException {
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }

  

}
