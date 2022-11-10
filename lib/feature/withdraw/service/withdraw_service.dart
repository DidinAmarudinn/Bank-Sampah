import 'dart:convert';
import 'dart:io';

import 'package:bank_sampah/feature/withdraw/model/pln_subscriber_model.dart';
import 'package:bank_sampah/feature/withdraw/model/ppob_request.dart';
import 'package:bank_sampah/feature/withdraw/pulsa/model/pulsa_model.dart';
import 'package:bank_sampah/utils/api_constants.dart';
import 'package:bank_sampah/utils/md5_converter.dart';
import 'package:dartz/dartz.dart';

import '../../../utils/exception.dart';
import '../../../utils/failure.dart';
import 'package:http/http.dart' as http;

import '../pdam/model/pdam_bill_check_model.dart';

class WithdrawService {
  Future<Either<Failure, bool>> checkout(PPOBRequest? ppobRequest,
      String idUser, String? idNasabah, String? idBsu) async {
    try {
      Map<String, String> map = {
        "id_user": idUser,
        "tgl_transaksi": ppobRequest?.tglTransaksi ?? "",
        "total_tagihan": ppobRequest?.totalTagihan ?? "",
        "jenis": ppobRequest?.jenis ?? "",
        "nomor_telepon": ppobRequest?.nomerTelepon ?? "",
        "nominal_pulsa": ppobRequest?.nominalPulsa ?? "",
        "jenis_produk": ppobRequest?.jenisProduct ?? "",
        "nomor_meter": ppobRequest?.nomerMeter ?? "",
        "nomor_registrasi": ppobRequest?.nomerRegistrasi ?? "",
        "nominal_token": ppobRequest?.nominalToken ?? "",
        "wilayah": ppobRequest?.wilayah ?? "",
        "nominal_pelanggan": ppobRequest?.nominalPelanggan ?? ""
      };
      if (idNasabah != null && idNasabah.isNotEmpty) {
        map["id_nasabah"] = idNasabah;
        map["kategori_user"] = "nasabah";
      }
      if (idBsu != null && idBsu.isNotEmpty) {
        map["id_bsu"] = idBsu;
        map["kategori_user"] = "bsu";
      }
      var request = http.MultipartRequest("POST", Uri.parse(ppobUrl));
      request.fields.addAll(map);
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

  Future<Either<Failure, PulsaModel?>> getPriceListPulsa() async {
    try {
      var request = http.Request('POST', Uri.parse(getPriceListPulsaUrl));
      request.body = json.encode({
        "commands": "pricelist",
        "username": "6281910532804",
        "sign": "7edccf37170af1dc3e70e5ddedbb77b1",
        "status": "active"
      });
      var reqResponse = await request.send();
      if (reqResponse.statusCode == 200) {
        var response = await http.Response.fromStream(reqResponse);
        var res = json.decode(response.body);
        return Right(PulsaModel.fromJson(res));
      } else {
        throw ServerException();
      }
    } on ServerException {
      return Left(ServerFailure("Internal Server Error"));
    } on SocketException {
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }

  Future<Either<Failure, PulsaModel?>> getPriceData() async {
    try {
      var request = http.Request('POST', Uri.parse(paketDataUrl));
      request.body = json.encode({
        "commands": "pricelist",
        "username": "6281910532804",
        "sign": "7edccf37170af1dc3e70e5ddedbb77b1",
        "status": "active"
      });
      var reqResponse = await request.send();
      if (reqResponse.statusCode == 200) {
        var response = await http.Response.fromStream(reqResponse);
        var res = json.decode(response.body);
        return Right(PulsaModel.fromJson(res));
      } else {
        throw ServerException();
      }
    } on ServerException {
      return Left(ServerFailure("Internal Server Error"));
    } on SocketException {
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }

  Future<Either<Failure, PulsaModel?>> getPriceListToken() async {
    try {
      var request = http.Request('POST', Uri.parse(getTokenPriceListUrl));
      request.body = json.encode({
        "commands": "pricelist",
        "username": "6281910532804",
        "sign": "7edccf37170af1dc3e70e5ddedbb77b1",
        "status": "active"
      });
      var reqResponse = await request.send();
      if (reqResponse.statusCode == 200) {
        var response = await http.Response.fromStream(reqResponse);
        var res = json.decode(response.body);
        return Right(PulsaModel.fromJson(res));
      } else {
        throw ServerException();
      }
    } on ServerException {
      return Left(ServerFailure("Internal Server Error"));
    } on SocketException {
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }

  Future<Either<Failure, PlnSubscriberModel?>> getUserSubscriberData(
      String customerId) async {
    try {
      String sign = generateMd5("6281910532804101634cc8fcb402b$customerId");
      var request = http.Request('POST', Uri.parse(getTokenPriceListUrl));
      var map = {
        "commands": "inquiry_pln",
        "username": "6281910532804",
        "hp": customerId,
        "sign": sign,
      };
      request.body = json.encode(map);
      var reqResponse = await request.send();
      if (reqResponse.statusCode == 200) {
        var response = await http.Response.fromStream(reqResponse);
        var res = json.decode(response.body);
        if (res["data"]["rc"] == "00") {
          return Right(PlnSubscriberModel.fromJson(res["data"]));
        } else {
          return Left(ServerFailure(res["data"]["message"]));
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

  Future<Either<Failure, PdamBillCheckModel?>> getUserBillCheck(
      String customerId, String codeWilayah) async {
    try {
      String sign = generateMd5("6281910532804101634cc8fcb402b$customerId");
      var request = http.Request('POST', Uri.parse(getTokenPriceListUrl));
      var map = {
        "commands": "inq-pasca",
        "username": "6281910532804",
        "code": "PDAMKOTA.SURABAYA",
        "hp": "10202001",
        "ref_id": "091283746515",
        "sign": "017b81645271095bb5668b295b8db165"
      };
      request.body = json.encode(map);
      var reqResponse = await request.send();
      if (reqResponse.statusCode == 200) {
        var response = await http.Response.fromStream(reqResponse);
        var res = json.decode(response.body);
        if (res["data"]["rc"] == "00") {
          return Right(PdamBillCheckModel.fromJson(res["data"]));
        } else {
          return Left(ServerFailure(res["data"]["message"]));
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
