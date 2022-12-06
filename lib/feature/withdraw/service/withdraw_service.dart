import 'dart:convert';
import 'dart:io';

import 'package:bank_sampah/feature/withdraw/model/pasca_bill_check_model.dart';
import 'package:bank_sampah/feature/withdraw/model/pln_subscriber_model.dart';
import 'package:bank_sampah/feature/withdraw/model/ppob_request.dart';
import 'package:bank_sampah/feature/withdraw/pdam/model/wilayah_model.dart';
import 'package:bank_sampah/feature/withdraw/pulsa/model/pulsa_model.dart';
import 'package:bank_sampah/utils/api_constants.dart';
import 'package:bank_sampah/utils/constants.dart';
import 'package:bank_sampah/utils/md5_converter.dart';
import 'package:dartz/dartz.dart';

import '../../../utils/exception.dart';
import '../../../utils/failure.dart';
import 'package:http/http.dart' as http;

import '../pdam/model/pdam_bill_check_model.dart';

class WithdrawService {
  Future<Either<Failure, bool>> checkout(
      PPOBRequest? ppobRequest, String idUser, String? idNasabah, String? idBsu,
      {PdamBillCheckModel? billCheckModel, PascaBillCheck? billCheck}) async {
    try {
      var data = billCheckModel?.toJson();
      var pascaData = billCheck?.toJson();
      Map<String, String> map = {
        "id_user": idUser,
        "tgl_transaksi": ppobRequest?.tglTransaksi ?? "",
        "total_tagihan": ppobRequest?.totalTagihan ?? "",
        "jenis": ppobRequest?.jenis ?? "",
        "nomor_telepon": ppobRequest?.nomerTelepon ?? "",
        "nominal_pulsa": ppobRequest?.nominalPulsa ?? "",
        "operator": ppobRequest?.operator ?? "",
        "jenis_produk": ppobRequest?.jenisProduct ?? "",
        "nomor_meter": ppobRequest?.nomerMeter ?? "",
        "nomor_registrasi": ppobRequest?.nomerRegistrasi ?? "",
        "nominal_token": ppobRequest?.nominalToken ?? "",
        "nominal_data": ppobRequest?.nominalData ?? "",
        "pulsa_code": ppobRequest?.codePulsa ?? "",
        "wilayah": ppobRequest?.wilayah ?? "",
        "nominal_pelanggan": ppobRequest?.nominalPelanggan ?? "",
        'code': ppobRequest?.code ?? "",
      };
      if (ppobRequest?.jenis == "PDAM") {
        map["hasil_ppob"] = jsonEncode(data);
        map["ref_id_postpaid"] = ppobRequest?.refId ?? "";
        map["nomor_pelanggan"] = ppobRequest?.nomerPelanggan ?? "";
      }
      if (ppobRequest?.jenisProduct == "tagihan") {
        map["hasil_ppob"] = jsonEncode(pascaData);
        map["ref_id_postpaid"] = ppobRequest?.refId ?? "";
      }
      if (idNasabah != null && idNasabah.isNotEmpty) {
        map["id_nasabah"] = idNasabah;
        map["kategori_user"] = "nasabah";
      }
      if (idBsu != null && idBsu.isNotEmpty) {
        map["id_bsu"] = idBsu;
        map["kategori_user"] = "bsu";
      }
      print(map);
      var request = http.MultipartRequest("POST", Uri.parse(ppobUrl));
      request.fields.addAll(map);
      var reqResponse = await request.send();
      if (reqResponse.statusCode == 200) {
        var response = await http.Response.fromStream(reqResponse);
        var res = json.decode(response.body);
        if (res["status"] == "true") {
          return const Right(true);
        } else {
          print(res["result"].toString());
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

  Future<Either<Failure, PulsaModel?>> getPriceListPulsa(String oprator) async {
    try {
      var request =
          http.Request('POST', Uri.parse("$getPriceListPulsaUrl$oprator"));
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

  Future<Either<Failure, PulsaModel?>> getPriceData(String operator) async {
    try {
      var request = http.Request('POST', Uri.parse("$paketDataUrl$operator"));
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
        print(res);
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

  Future<Either<Failure, WilayahModel?>> getWilayahModel() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse(getWilayahPDAMUrl));
      request.body = json.encode({
        "commands": "pricelist-pasca",
        "username": "6281910532804",
        "sign": "7edccf37170af1dc3e70e5ddedbb77b1",
        "status": "all"
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);
        return Right(WilayahModel.fromJson(decodedMap["data"]));
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
      var headers = {'Content-Type': 'application/json'};
      String refId = generateRefId(customerId);
      String sign = generateMd5("6281910532804101634cc8fcb402b$refId");
      var request = http.Request('POST', Uri.parse(billCheckPDAMUrl));
      var map = {
        "commands": "inq-pasca",
        "username": "6281910532804",
        "code": codeWilayah,
        "hp": customerId,
        "ref_id": refId,
        "sign": sign
      };

      request.body = json.encode(map);
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);

        return Right(PdamBillCheckModel.fromJson(decodedMap["data"]));
      } else {
        throw ServerException();
      }
    } on ServerException {
      return Left(ServerFailure("Internal Server Error"));
    } on SocketException {
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }

  Future<Either<Failure, PascaBillCheck?>> getUserBillCheckListrik(
      String customerId) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      String refId = generateRefId(customerId);
      String sign = generateMd5("6281910532804101634cc8fcb402b$refId");
      var request = http.Request('POST', Uri.parse(billCheckListrikPascaUrl));
      var map = {
        "commands": "inq-pasca",
        "username": "6281910532804",
        "code": "PLNPOSTPAID",
        "hp": customerId,
        "ref_id": refId,
        "sign": sign
      };

      request.body = json.encode(map);
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseString = await response.stream.bytesToString();
        final decodedMap = json.decode(responseString);
        return Right(PascaBillCheck.fromJson(decodedMap["data"]));
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
