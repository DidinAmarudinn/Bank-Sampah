import 'dart:convert';
import 'dart:io';

import 'package:bank_sampah/feature/profile/model/others_info_model.dart';
import 'package:bank_sampah/feature/profile/model/update_data_bsu_request.dart';
import 'package:bank_sampah/feature/profile/model/update_data_request.dart';
import 'package:bank_sampah/utils/api_constants.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../core/base_response.dart';
import '../../../core/base_response_list.dart';
import '../../../utils/exception.dart';
import '../../../utils/failure.dart';
import '../../login/model/bsu_model.dart';
import '../../nasabah/model/nasabah_model.dart';

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
        'alamat': updateDataRequest.alamat,
        'status_ojek_sampah': updateDataRequest.statusOjekSampah
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

  Future<Either<Failure, bool>> updateProfileBSU(
      UpdateDataBSURequest updateDataBSURequest, String idBSU) async {
    try {
      var request =
          http.MultipartRequest("POST", Uri.parse(updateProfileBsuUrl));
      request.fields.addAll({
        'id_bsu': idBSU,
        'id_kecamatan': updateDataBSURequest.idKecamatan,
        'id_kelurahan': updateDataBSURequest.idKelurahan,
        'nama_unit': updateDataBSURequest.namaUnit,
        'no_kontak': updateDataBSURequest.noKontak,
        'email': updateDataBSURequest.email,
        'alamat': updateDataBSURequest.alamat,
        'periode_angkut': updateDataBSURequest.priodeAngkut,
        'tgl_angkut': updateDataBSURequest.tanggalAngkut,
        'hari_angkut': updateDataBSURequest.hariAngkut,
        'jml_lk': updateDataBSURequest.jumlahLK,
        'jml_pr': updateDataBSURequest.jumlahPR,
        'ketua_unit': updateDataBSURequest.ketuaUnit,
        'status': updateDataBSURequest.status,
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

  Future<Either<Failure, BaseResponse<OthersInfoModel>?>>
      getOthersInfo() async {
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

  Future<Either<Failure, NasabahModel?>> getDataNsabah(int userId) async {
    try {
      final response = await http.get(Uri.parse("$getDataNsabahUrl$userId"));
      print("$getDataNsabahUrl$userId");
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        if (data["status"] == "true") {
          final result = BaseResponseList<NasabahModel>.fromJson(data, (data) {
            List<NasabahModel> nasabahList =
                data.map((e) => NasabahModel.fromJson(e)).toList();
            return nasabahList;
          });
          print(result.data?[0].id);
          return Right(result.data?[0]);
        } else {
          return const Right(null);
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

  Future<Either<Failure, BSUModel?>> getDataBsu(String idBsu) async {
    try {
      final response = await http.get(Uri.parse("$getDataBsuUrl$idBsu"));
      var data = json.decode(response.body);

      if (response.statusCode == 200) {
        if (data["status"] == "true") {
          final result = BaseResponseList<BSUModel>.fromJson(data, (data) {
            List<BSUModel> bsuList =
                data.map((e) => BSUModel.fromJson(e)).toList();
            return bsuList;
          });
          return Right(result.data?[0]);
        } else {
          return const Right(null);
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

  Future<Either<Failure, bool>> changePassword(
      String  newPassword, String idUser) async {
    try {
      var request =
          http.MultipartRequest("POST", Uri.parse(changePasswordUrl));
      request.fields.addAll({
        'id_user': idUser,
        'password_baru': newPassword
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
}
