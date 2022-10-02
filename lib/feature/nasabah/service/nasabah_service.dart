import 'dart:convert';
import 'dart:io';

import 'package:bank_sampah/core/base_response_list.dart';
import 'package:bank_sampah/feature/nasabah/model/complete_profile_request.dart';
import 'package:bank_sampah/feature/nasabah/model/district_model.dart';
import 'package:bank_sampah/feature/nasabah/model/nasabah_category_model.dart';
import 'package:bank_sampah/feature/nasabah/model/vilage_model.dart';
import 'package:bank_sampah/utils/exception.dart';
import 'package:bank_sampah/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../utils/api_constants.dart';
import '../model/nasabah_model.dart';

class NasabahService {
  Future<Either<Failure, NasabahModel?>> getDataNsabah(int userId) async {
    try {
      final response = await http.get(Uri.parse("$getDataNsabahUrl$userId"));
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        if (data["status"] == "true") {
          final result = BaseResponseList<NasabahModel>.fromJson(data, (data) {
            List<NasabahModel> nasabahList =
                data.map((e) => NasabahModel.fromJson(e)).toList();
            return nasabahList;
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

  Future<Either<Failure, BaseResponseList<DistrictModel>?>> getDistrict(
      String param) async {
    try {
      final response = await http.get(Uri.parse("$getDistrictUrl$param"));
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        if (data["status"] == "true") {
          final result = BaseResponseList<DistrictModel>.fromJson(data, (data) {
            List<DistrictModel> districs =
                data.map((e) => DistrictModel.fromJson(e)).toList();
            return districs;
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

  Future<Either<Failure, BaseResponseList<NasabahCategoryModel>?>>
      getNasabahCategory() async {
    try {
      final response = await http.get(Uri.parse(getNsabahCategoryUrl));
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        if (data["status"] == "true") {
          final result =
              BaseResponseList<NasabahCategoryModel>.fromJson(data, (data) {
            List<NasabahCategoryModel> nasabahCategory =
                data.map((e) => NasabahCategoryModel.fromJson(e)).toList();
            return nasabahCategory;
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

  Future<Either<Failure, BaseResponseList<VilageModel>?>> getVilages(
      String districtName, String cityName) async {
    try {
      var map = <String, String>{};
      map['nama_kecamatan'] = districtName;
      map['nama_kabupaten'] = cityName;
      var request = http.MultipartRequest("POST", Uri.parse(getVilageUrl));
      request.fields.addAll(map);
      var reqResponse = await request.send();
      if (reqResponse.statusCode == 200) {
        var response = await http.Response.fromStream(reqResponse);
        var res = json.decode(response.body);
        if (res["status"] == "true") {
          final result = BaseResponseList<VilageModel>.fromJson(res, (data) {
            List<VilageModel> districs =
                data.map((e) => VilageModel.fromJson(e)).toList();
            return districs;
          });
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

  Future<Either<Failure, bool>> postCompleteProfile(
      CompleteProfileRequest completeProfileRequest) async {
    try {
      var request =
          http.MultipartRequest("POST", Uri.parse(postCompleteProfileUrl));
      request.fields.addAll({
        'id_user_nasabah': completeProfileRequest.idUserNasabah,
        'id_jenis': completeProfileRequest.idJenis,
        'id_kecamatan': completeProfileRequest.idKecamatan,
        'id_kelurahan': completeProfileRequest.idKelurahan,
        'nama_nasabah': completeProfileRequest.namaNasabah,
        'no_kontak': completeProfileRequest.noKontak,
        'email': completeProfileRequest.email,
        'alamat': completeProfileRequest.alamat,
        'add_bukualamat': completeProfileRequest.addBukualamat,
        'nama_alamat': completeProfileRequest.namaAlamat
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