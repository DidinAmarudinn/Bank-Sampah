import 'package:json_annotation/json_annotation.dart';

part 'activity_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ActivityModel {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "search")
  String? search;
  @JsonKey(name: "order")
  String? order;
  @JsonKey(name: "record")
  String? record;
  @JsonKey(name: "recordPerPage")
  String? recordPerPage;
  @JsonKey(name: "total_rows")
  int? totalRows;
  @JsonKey(name: "result")
  List<Activty>? result;

  ActivityModel(
      {this.status,
      this.search,
      this.order,
      this.record,
      this.recordPerPage,
      this.totalRows,
      this.result});
 factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityModelToJson(this);
}

@JsonSerializable(genericArgumentFactories: true)
class Activty {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "id_kategori")
  String? idKategori;
  @JsonKey(name: "id_tags")
  String? idTags;
  @JsonKey(name: "jenis")
  String? jenis;
  @JsonKey(name: "judul_artikel")
  String? judulArtikel;
  @JsonKey(name: "slug")
  String? slug;
  @JsonKey(name: "isi_artikel")
  String? isiArtikel;
  @JsonKey(name: "tgl_publish")
  String? tglPublish;
  @JsonKey(name: "tampil")
  String? tampil;
  @JsonKey(name: "filefoto")
  String? filefoto;
  @JsonKey(name: "meta_title")
  String? metaTitle;
  @JsonKey(name: "meta_description")
  String? metaDescription;
  @JsonKey(name: "keyword")
  String? keyword;
  @JsonKey(name: "focus_keyword")
  String? focusKeyword;
  @JsonKey(name: "meta_image")
  String? metaImage;
  @JsonKey(name: "view")
  String? view;
  @JsonKey(name: "waktu_kegiatan")
  String? waktuKegiatan;
  @JsonKey(name: "tempat_kegiatan")
  String? tempatKegiatan;
  @JsonKey(name: "kategori")
  String? kategori;
  @JsonKey(name: "idartikel")
  String? idartikel;
  @JsonKey(name: "path_image")
  String? pathImage;

  Activty(
      {this.id,
      this.idKategori,
      this.idTags,
      this.jenis,
      this.judulArtikel,
      this.slug,
      this.isiArtikel,
      this.tglPublish,
      this.tampil,
      this.filefoto,
      this.metaTitle,
      this.metaDescription,
      this.keyword,
      this.focusKeyword,
      this.metaImage,
      this.view,
      this.waktuKegiatan,
      this.tempatKegiatan,
      this.kategori,
      this.idartikel,
      this.pathImage});

   factory Activty.fromJson(Map<String, dynamic> json) =>
      _$ActivtyFromJson(json);

  Map<String, dynamic> toJson() => _$ActivtyToJson(this);
}