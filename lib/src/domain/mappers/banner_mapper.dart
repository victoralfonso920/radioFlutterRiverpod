import '../../data/remote/dto/banners_dto.dart';
import '../model/banner_item.dart';
import 'mapper.dart';

class BannerItemMapper extends Mapper<List<BannersDto>, List<BannerItem>> {
  @override
  List<BannerItem> call(List<BannersDto> object) {

    final List<BannerItem> radioDataList = object
        .map(
          (value) => BannerItem(
              type: value.type ?? "",
              description: value.description ?? "",
              bannerId: value.bannerId ?? "",
              image: value.image ?? "",
              url: value.url ?? "",
              priority: value.priority ?? 0
          ),
        ).toList();
         
        return radioDataList;
  }
}
