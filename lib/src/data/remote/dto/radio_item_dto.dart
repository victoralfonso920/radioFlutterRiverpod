import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'radio_item_dto.g.dart';

@JsonSerializable()
class RadioItemDto extends Equatable {
  @JsonKey(name: 'id_radio')
  final int? radioId;
  @JsonKey(name: 'nombre_radio')
  final String? name;
  @JsonKey(name: 'url_streaming')
  final String? urlStreaming;
  @JsonKey(name: 'posee_radio')
  final bool? isRadio;
  @JsonKey(name: 'url_streaming_radio')
  final String? urlStreamingRadio;

  const RadioItemDto({
    required this.radioId,
    required this.name,
    required this.urlStreaming,
    required this.isRadio,
    required this.urlStreamingRadio,
  });

  factory RadioItemDto.fromJson(Map<String, dynamic> json) =>
      _$RadioItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RadioItemDtoToJson(this);

  @override
  List<Object?> get props =>
      [radioId, name, urlStreaming, isRadio, urlStreamingRadio];
}
