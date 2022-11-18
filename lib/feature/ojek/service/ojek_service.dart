import 'dart:convert';
import 'dart:io';

import 'package:bank_sampah/feature/ojek/model/detail_ojek_sampah_model.dart';
import 'package:bank_sampah/feature/ojek/model/give_rating_request.dart';
import 'package:bank_sampah/feature/ojek/model/vilage_available_model.dart';
import 'package:dartz/dartz.dart';

import '../../../core/base_response.dart';
import '../../../core/base_response_list.dart';
import '../../../utils/api_constants.dart';
import '../../../utils/exception.dart';
import '../../../utils/failure.dart';
import '../../user_available_address/user_available_address.dart';
import '../model/gudang_model.dart';
import 'package:http/http.dart' as http;

import '../model/order_ojek_request.dart';

class OjekService {
  Future<Either<Failure, BaseResponseList<GudangModel>?>>
      getListGudang() async {
    try {
      final response = await http.get(Uri.parse(getListGudangUrl));
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        if (data["status"] == "true") {
          final result = BaseResponseList<GudangModel>.fromJson(data, (data) {
            List<GudangModel> nasabahCategory =
                data.map((e) => GudangModel.fromJson(e)).toList();
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

  Future<Either<Failure, BaseResponseList<VilageAvailableModel>?>>
      getListVilageAvailable(String idGudang) async {
    try {
      final response =
          await http.get(Uri.parse(getListVilageAvailableUrl + idGudang));
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        if (data["status"] == "true") {
          final result =
              BaseResponseList<VilageAvailableModel>.fromJson(data, (data) {
            List<VilageAvailableModel> vilages =
                data.map((e) => VilageAvailableModel.fromJson(e)).toList();
            return vilages;
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

  Future<Either<Failure, UserAvailableAddress?>> getListAvailableAddress(
      {required String idGudang,
      required String idKelurahan,
      required String idNasabah}) async {
    try {
      final response = await http.get(Uri.parse(
          "$getUserAvailableAddress/$idGudang/$idKelurahan/$idNasabah"));
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        if (data["status"] == "true") {
          final result = UserAvailableAddress.fromJson(data);
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

  Future<Either<Failure, int?>> orderOjek(
      OrderOjekRequest? orderOjekRequest) async {
    try {
      var request = http.MultipartRequest("POST", Uri.parse(addOjekSampahUrl));
      Map<String, String> body = {
        "id_user": orderOjekRequest?.idUser ?? "",
        "id_nasabah": orderOjekRequest?.idNasabah ?? "",
        "id_gudang": orderOjekRequest?.idGudang ?? "",
        "tgl_transaksi": orderOjekRequest?.tanggalTransaksi ?? "",
        "tgl_jatuh_tempo": orderOjekRequest?.tanggalJatuhTempo ?? "",
        "kategori_penyesuaian": orderOjekRequest?.kategoriPenyesuaian ?? "",
        "jml_angkut_berlangganan":
            orderOjekRequest?.jmlAngkutBerlangganan ?? "",
        "keterangan": orderOjekRequest?.keterangan ?? "",
        "id_kelurahan": orderOjekRequest?.idKelurahan ?? "",
        "id_jenis_nasabah": orderOjekRequest?.idJenisNasabah ?? "",
        "id_buku_alamat": orderOjekRequest?.idBukuAlamat ?? "",
        "detail_alamat": orderOjekRequest?.detailAlamat ?? "",
        "harga": orderOjekRequest?.harga ?? "",
        "total_tagihan": orderOjekRequest?.harga ?? ""
      };
      request.fields.addAll(body);
      var reqResponse = await request.send();
      if (reqResponse.statusCode == 200) {
        var response = await http.Response.fromStream(reqResponse);
        print(response.body);
        var res = json.decode(response.body);
        if (res["status"] == "true") {
          return Right(int.parse(res["id_transaksi"].toString()));
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

  Future<Either<Failure, bool>> giveRating(
      GiveRatingRequest? giveRatingRequest) async {
    try {
      var request = http.MultipartRequest("POST", Uri.parse(giveRatingUrl));
      Map<String, String> body = {
        "id_transaksi": giveRatingRequest?.idTransaksi ?? "",
        "id_nasabah": giveRatingRequest?.idNasabah ?? "",
        "nilai": giveRatingRequest?.nilai ?? "",
        "komentar": giveRatingRequest?.komentar ?? ""
      };
      print(body);
      request.fields.addAll(body);
      var reqResponse = await request.send();
      if (reqResponse.statusCode == 200) {
        var response = await http.Response.fromStream(reqResponse);
        var res = json.decode(response.body);
        print(res);
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

  Future<Either<Failure, BaseResponse<DetailOjekSampahModel>?>>
      getDetailTransaction(String idTransaction) async {
    try {
      final response =
          await http.get(Uri.parse("$getDetailOjekSampahUrl$idTransaction"));
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
        if (res["status"] == "true") {
          final result = BaseResponse<DetailOjekSampahModel>.fromJson(
              res, (data) => DetailOjekSampahModel.fromJson(data));
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
