// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RadioItemDto _$RadioItemDtoFromJson(Map<String, dynamic> json) => RadioItemDto(
      radioId: json['id_radio'] as int?,
      name: json['nombre_radio'] as String?,
      urlStreaming: json['url_streaming'] as String?,
      isRadio: json['posee_radio'] as bool?,
      urlStreamingRadio: json['url_streaming_radio'] as String?,
    );

Map<String, dynamic> _$RadioItemDtoToJson(RadioItemDto instance) =>
    <String, dynamic>{
      'id_radio': instance.radioId,
      'nombre_radio': instance.name,
      'url_streaming': instance.urlStreaming,
      'posee_radio': instance.isRadio,
      'url_streaming_radio': instance.urlStreamingRadio,
    };
