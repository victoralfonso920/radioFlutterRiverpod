import '../../domain/repository/get_data_radio_repository.dart';
import '../remote/api/data_sources/banner_data_source/get_data_banners.dart';
import '../remote/api/data_sources/radio_data_source/get_data_radio.dart';
import '../remote/dto/banners_dto.dart';
import '../remote/dto/radio_item_dto.dart';

class GetDataRadioRepositoryImpl extends GetDataRadioRepository{
  final GetDataRadio dataRadio;
  final GetDataBanners dataBanners;

  GetDataRadioRepositoryImpl(this.dataRadio,this.dataBanners);

  @override
  Future<List<RadioItemDto>> getDataRadio() {
   return dataRadio.getDataRadio();
  }

  @override
  Future<List<BannersDto>> getDataBanner() {
    return dataBanners.getDataBanners();
  }
  
}