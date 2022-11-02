import '../mappers/banner_mapper.dart';
import '../model/banner_item.dart';
import '../repository/get_data_radio_repository.dart';

class GetDataBannerUseCase{
  final GetDataRadioRepository repo;

  GetDataBannerUseCase(this.repo);

   Future<List<BannerItem>> invoke() async {
    final BannerItemMapper bannerMapper = BannerItemMapper();
    final result = await repo.getDataBanner();
    return bannerMapper.call(result);
  }
}