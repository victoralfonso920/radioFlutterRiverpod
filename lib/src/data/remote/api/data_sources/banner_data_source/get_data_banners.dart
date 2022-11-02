import '../../../dto/banners_dto.dart';
import '../../params/keys_params.dart';
import '../../params/queries.dart';
import '../../provider/api_provider.dart';

abstract class GetDataBanners {
  Future<List<BannersDto>> getDataBanners();
}

class GetDataBannerImpl implements GetDataBanners {

  final ApiProvider apiProvider;

  GetDataBannerImpl({required this.apiProvider});

  @override
  Future<List<BannersDto>> getDataBanners() async {

     final Map<String, dynamic> headers = {
      'Content-Type': 'application/json'
    };
      final Map<String, dynamic> params = {
      prefix: banners,
    };

    final List<dynamic> response = await apiProvider.getListFromMap(sufixDataRadios, params, headers);
    final result = response.map((e) => BannersDto.fromJson(e)).toList();
    
    return result;
  }
}