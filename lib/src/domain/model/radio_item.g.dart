// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RadioItem _$RadioItemFromJson(Map<String, dynamic> json) => RadioItem(
      radioId: json['id_radio'] as int,
      name: json['nombre_radio'] as String,
      urlStreaming: json['url_streaming'] as String,
      isRadio: json['posee_radio'] as bool,
      urlStreamingRadio: json['url_streaming_radio'] as String,
    );

Map<String, dynamic> _$RadioItemToJson(RadioItem instance) => <String, dynamic>{
      'id_radio': instance.radioId,
      'nombre_radio': instance.name,
      'url_streaming': instance.urlStreaming,
      'posee_radio': instance.isRadio,
      'url_streaming_radio': instance.urlStreamingRadio,
    };
