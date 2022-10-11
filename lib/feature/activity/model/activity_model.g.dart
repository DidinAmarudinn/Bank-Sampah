// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityModel _$ActivityModelFromJson(Map<String, dynamic> json) =>
    ActivityModel(
      status: json['status'] as String?,
      search: json['search'] as String?,
      order: json['order'] as String?,
      record: json['record'] as String?,
      recordPerPage: json['recordPerPage'] as String?,
      totalRows: json['total_rows'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Activty.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ActivityModelToJson(ActivityModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'search': instance.search,
      'order': instance.order,
      'record': instance.record,
      'recordPerPage': instance.recordPerPage,
      'total_rows': instance.totalRows,
      'result': instance.result,
    };

Activty _$ActivtyFromJson(Map<String, dynamic> json) => Activty(
      id: json['id'] as String?,
      idKategori: json['id_kategori'] as String?,
      idTags: json['id_tags'] as String?,
      jenis: json['jenis'] as String?,
      judulArtikel: json['judul_artikel'] as String?,
      slug: json['slug'] as String?,
      isiArtikel: json['isi_artikel'] as String?,
      tglPublish: json['tgl_publish'] as String?,
      tampil: json['tampil'] as String?,
      filefoto: json['filefoto'] as String?,
      metaTitle: json['meta_title'] as String?,
      metaDescription: json['meta_description'] as String?,
      keyword: json['keyword'] as String?,
      focusKeyword: json['focus_keyword'] as String?,
      metaImage: json['meta_image'] as String?,
      view: json['view'] as String?,
      waktuKegiatan: json['waktu_kegiatan'] as String?,
      tempatKegiatan: json['tempat_kegiatan'] as String?,
      kategori: json['kategori'] as String?,
      idartikel: json['idartikel'] as String?,
      pathImage: json['path_image'] as String?,
    );

Map<String, dynamic> _$ActivtyToJson(Activty instance) => <String, dynamic>{
      'id': instance.id,
      'id_kategori': instance.idKategori,
      'id_tags': instance.idTags,
      'jenis': instance.jenis,
      'judul_artikel': instance.judulArtikel,
      'slug': instance.slug,
      'isi_artikel': instance.isiArtikel,
      'tgl_publish': instance.tglPublish,
      'tampil': instance.tampil,
      'filefoto': instance.filefoto,
      'meta_title': instance.metaTitle,
      'meta_description': instance.metaDescription,
      'keyword': instance.keyword,
      'focus_keyword': instance.focusKeyword,
      'meta_image': instance.metaImage,
      'view': instance.view,
      'waktu_kegiatan': instance.waktuKegiatan,
      'tempat_kegiatan': instance.tempatKegiatan,
      'kategori': instance.kategori,
      'idartikel': instance.idartikel,
      'path_image': instance.pathImage,
    };
