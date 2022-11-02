import 'package:json_annotation/json_annotation.dart';

part 'radio_item.g.dart';

@JsonSerializable()
class RadioItem {
  @JsonKey(name: 'id_radio')
  final int radioId;
  @JsonKey(name: 'nombre_radio')
  final String name;
  @JsonKey(name: 'url_streaming')
  final String urlStreaming;
  @JsonKey(name: 'posee_radio')
  final bool isRadio;
  @JsonKey(name: 'url_streaming_radio')
  final String urlStreamingRadio;

  const RadioItem({
    required this.radioId,
    required this.name,
    required this.urlStreaming,
    required this.isRadio,
    required this.urlStreamingRadio,
  });

  factory RadioItem.createEmptyInstance() => const RadioItem(
        radioId: 0,
        name: "",
        urlStreaming: "",
        isRadio: false,
        urlStreamingRadio: "",
      );

  factory RadioItem.fromJson(Map<String, dynamic> json) =>
      _$RadioItemFromJson(json);

  Map<String, dynamic> toJson() => _$RadioItemToJson(this);
}
