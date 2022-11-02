import 'package:json_annotation/json_annotation.dart';
part 'banner_item.g.dart';

@JsonSerializable()
class BannerItem{
  @JsonKey(name: 'Tipo')
  final String type;
  @JsonKey(name: 'IDBanner')
  final String bannerId;
  @JsonKey(name: 'Imagen')
  final String image;
  @JsonKey(name: 'URL')
  final String url;
  @JsonKey(name: 'Descripcion')
  final String description;
  @JsonKey(name: 'Prioridad')
  final int priority;

  const BannerItem({
        required this.type,
        required this.bannerId,
        required this.image,
        required this.url,
        required this.description,
        required this.priority
  });

  factory BannerItem.createEmptyInstance() => const BannerItem(
    type: "",
    bannerId: "",
    image: "",
    url: "",
    description: "",
    priority: 0,
  );

  factory BannerItem.fromJson(Map<String, dynamic> json) =>
      _$BannerItemFromJson(json);

  Map<String, dynamic> toJson() => _$BannerItemToJson(this);


}