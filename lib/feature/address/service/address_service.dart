import 'dart:convert';
import 'dart:io';

import 'package:bank_sampah/feature/address/model/add_address_request.dart';
import 'package:bank_sampah/feature/address/model/user_address_model.dart';
import 'package:bank_sampah/utils/api_constants.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../core/base_response_list.dart';
import '../../../utils/exception.dart';
import '../../../utils/failure.dart';

class AddressService {
  get getListNasbahBsuUrl => null;

  Future<Either<Failure, BaseResponseList<UserAddressModel>?>>
      getListUserAddress(String nasabaID) async {
    try {
      final response =
          await http.get(Uri.parse("$getListUserAddressUrl$nasabaID"));
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        if (data["status"] == "true") {
          final result =
              BaseResponseList<UserAddressModel>.fromJson(data, (data) {
            List<UserAddressModel> userAddressList =
                data.map((e) => UserAddressModel.fromJson(e)).toList();
            return userAddressList;
          });
          return Right(result);
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

  Future<Either<Failure, bool>> addNasabahAddress(
      AddAddressRequest addRequest, String idNasabah) async {
    try {
      var request =
          http.MultipartRequest("POST", Uri.parse(addNabasahAddressUrl));
      request.fields.addAll({
        'id_nasabah': idNasabah,
        'alamat_lengkap': addRequest.alamatLengkap,
        'id_kecamatan': addRequest.idKecamatan,
        'id_kelurahan': addRequest.idKelurahan,
        'nama_alamat': addRequest.namaAlamat
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
