import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'banners_dto.g.dart';

@JsonSerializable()
class BannersDto extends Equatable {
  @JsonKey(name: 'Tipo')
  final String? type;
  @JsonKey(name: 'IDBanner')
  final String? bannerId;
  @JsonKey(name: 'Imagen')
  final String? image;
  @JsonKey(name: 'URL')
  final String? url;
  @JsonKey(name: 'Descripcion')
  final String? description;
  @JsonKey(name: 'Prioridad')
  final int? priority;

  const BannersDto({
        required this.type,
        required this.bannerId,
        required this.image,
        required this.url,
        required this.description,
        required this.priority
  });

  factory BannersDto.fromJson(Map<String, dynamic> json) =>
      _$BannersDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BannersDtoToJson(this);

  @override
  List<Object?> get props =>
      [type,bannerId,image,url,description,priority];
}