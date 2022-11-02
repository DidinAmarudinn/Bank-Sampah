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

class WithdrawService {
  Future<Either<Failure, bool>> forgotPassword(PPOBRequest? ppobRequest) async {
    try {
      Map<String, String> map = {
        "id_user": ppobRequest?.idUser ?? "",
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
      print(request.body);
      var reqResponse = await request.send();
      if (reqResponse.statusCode == 200) {
        var response = await http.Response.fromStream(reqResponse);
        print(response.body);
        var res = json.decode(response.body);
        if (res["data"]["rc"] == "00") {
          print("cek");
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
}
