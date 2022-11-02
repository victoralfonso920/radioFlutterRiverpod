// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerItem _$BannerItemFromJson(Map<String, dynamic> json) => BannerItem(
      type: json['Tipo'] as String,
      bannerId: json['IDBanner'] as String,
      image: json['Imagen'] as String,
      url: json['URL'] as String,
      description: json['Descripcion'] as String,
      priority: json['Prioridad'] as int,
    );

Map<String, dynamic> _$BannerItemToJson(BannerItem instance) =>
    <String, dynamic>{
      'Tipo': instance.type,
      'IDBanner': instance.bannerId,
      'Imagen': instance.image,
      'URL': instance.url,
      'Descripcion': instance.description,
      'Prioridad': instance.priority,
    };
