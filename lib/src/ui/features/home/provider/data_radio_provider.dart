import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../di/service_locator.dart';
import '../../../../domain/model/banner_item.dart';
import '../../../../domain/model/radio_item.dart';
import '../../../../domain/use_case/get_banner_data_use_case.dart';
import '../../../../domain/use_case/get_radio_data_use_case.dart';
import '../../../../utils/resources/img_routes.dart';


final dataRadioProvider = FutureProvider<List<RadioItem>>((ref) {
    final GetDataRadioUseCase useCase = sl.get<GetDataRadioUseCase>();
  return  useCase.invoke();
});

final dataBannerProvider = FutureProvider<List<BannerItem>>((ref) {
  final GetDataBannerUseCase useCase = sl.get<GetDataBannerUseCase>();
  return  useCase.invoke();
});

final bannerRadioProvider = StateProvider<String>((ref) {
  return  bannerAbc;
});

final bannerRadioPlayingProvider = StateProvider<bool>((ref) {
  return  false;
});
