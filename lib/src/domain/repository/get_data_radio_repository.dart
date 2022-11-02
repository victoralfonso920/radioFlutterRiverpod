import '../../data/remote/dto/banners_dto.dart';
import '../../data/remote/dto/radio_item_dto.dart';

abstract class GetDataRadioRepository {
  Future<List<RadioItemDto>> getDataRadio();
  Future<List<BannersDto>> getDataBanner();
}