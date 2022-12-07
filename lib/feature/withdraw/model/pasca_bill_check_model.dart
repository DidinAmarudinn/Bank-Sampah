class PascaBillCheck {
  int? trId;
  String? code;
  String? hp;
  String? trName;
  String? period;
  int? nominal;
  int? admin;
  String? refId;
  String? responseCode;
  String? message;
  int? price;
  int? sellingPrice;
  DescPasca? desc;

  PascaBillCheck(
      {this.trId,
      this.code,
      this.hp,
      this.trName,
      this.period,
      this.nominal,
      this.admin,
      this.refId,
      this.responseCode,
      this.message,
      this.price,
      this.sellingPrice,
      this.desc});

  PascaBillCheck.fromJson(Map<String, dynamic> json) {
    trId = json['tr_id'];
    code = json['code'];
    hp = json['hp'];
    trName = json['tr_name'];
    period = json['period'];
    nominal = json['nominal'];
    admin = json['admin'];
    refId = json['ref_id'];
    responseCode = json['response_code'];
    message = json['message'];
    price = json['price'];
    sellingPrice = json['selling_price'];
    desc = json['desc'] != null ? DescPasca.fromJson(json['desc']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tr_id'] = trId;
    data['code'] = code;
    data['hp'] = hp;
    data['tr_name'] = trName;
    data['period'] = period;
    data['nominal'] = nominal;
    data['admin'] = admin;
    data['ref_id'] = refId;
    data['response_code'] = responseCode;
    data['message'] = message;
    data['price'] = price;
    data['selling_price'] = sellingPrice;
    if (desc != null) {
      data['desc'] = desc!.toJson();
    }
    return data;
  }
}

class DescPasca {
  String? tarif;
  int? daya;
  String? lembarTagihan;
  Tagihan? tagihan;

  DescPasca({this.tarif, this.daya, this.lembarTagihan, this.tagihan});

  DescPasca.fromJson(Map<String, dynamic> json) {
    tarif = json['tarif'];
    daya = json['daya'];
    lembarTagihan = json['lembar_tagihan'];
    tagihan =
        json['tagihan'] != null ? Tagihan.fromJson(json['tagihan']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tarif'] = tarif;
    data['daya'] = daya;
    data['lembar_tagihan'] = lembarTagihan;
    if (tagihan != null) {
      data['tagihan'] = tagihan!.toJson();
    }
    return data;
  }
}

class Tagihan {
  List<DetailPasca>? detail;

  Tagihan({this.detail});

  Tagihan.fromJson(Map<String, dynamic> json) {
    if (json['detail'] != null) {
      detail = <DetailPasca>[];
      json['detail'].forEach((v) {
        detail!.add(DetailPasca.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (detail != null) {
      data['detail'] = detail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DetailPasca {
  String? periode;
  String? nilaiTagihan;
  String? admin;
  String? denda;
  int? total;

  DetailPasca(
      {this.periode, this.nilaiTagihan, this.admin, this.denda, this.total});

  DetailPasca.fromJson(Map<String, dynamic> json) {
    periode = json['periode'];
    nilaiTagihan = json['nilai_tagihan'];
    admin = json['admin'];
    denda = json['denda'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['periode'] = periode;
    data['nilai_tagihan'] = nilaiTagihan;
    data['admin'] = admin;
    data['denda'] = denda;
    data['total'] = total;
    return data;
  }
}
