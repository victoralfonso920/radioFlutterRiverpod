
import 'package:dio/dio.dart';
import 'package:dio_log/interceptor/dio_log_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../data/remote/api/data_sources/banner_data_source/get_data_banners.dart';
import '../data/remote/api/data_sources/radio_data_source/get_data_radio.dart';

import '../data/remote/api/provider/api_provider.dart';
import '../data/repository/get_data_radio_repository_impl.dart';
import '../data/tools/flavor_keys.dart';
import '../domain/repository/get_data_radio_repository.dart';
import '../domain/use_case/get_banner_data_use_case.dart';
import '../domain/use_case/get_radio_data_use_case.dart';
import '../nav/navigation_service.dart';
import '../utils/flavor/flavor_config.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //TOOLS
  sl.registerLazySingleton(() => NavigationService());
  //API_PROVIDER
  sl.registerFactoryParam<ApiProvider, String, bool>(
          (url, isGraphQL) => ApiProvider(dio: getDio(url)));
  // DATA_SOURCE
  sl.registerLazySingleton<GetDataRadio>(() =>
      GetDataRadioImpl(
          apiProvider: sl.get<ApiProvider>(param1: FlavorConfig.getValue(FlavorKeys.serverUrl), param2: false)));

  sl.registerLazySingleton<GetDataBanners>(() =>
      GetDataBannerImpl(
          apiProvider: sl.get<ApiProvider>(param1: FlavorConfig.getValue(FlavorKeys.serverUrl), param2: false)));
  //USE CASE
  sl.registerLazySingleton<GetDataRadioUseCase>(() => GetDataRadioUseCase(sl()));
  sl.registerLazySingleton<GetDataBannerUseCase>(() => GetDataBannerUseCase(sl()));

  //REPOSITORY
  sl.registerLazySingleton<GetDataRadioRepository>(() => GetDataRadioRepositoryImpl(sl(), sl()));

}

Dio getDio(String url) {
  final dio = Dio(
    getBaseOptions(url),
  );

  if (kDebugMode) {
    DioLogInterceptor.enablePrintLog = false;
    dio.interceptors.add(getLogger());
    dio.interceptors.add(DioLogInterceptor());
  }
  return dio;
}

// Network Interceptors
BaseOptions getBaseOptions(String url) =>
    BaseOptions(
      validateStatus: (status) {
        return true;
      },
      headers: {
        'Content-Type': 'application/json',
      },
      followRedirects: false,
      baseUrl: url,
      connectTimeout: 60000,
      receiveTimeout: 60000,
    );

PrettyDioLogger getLogger() =>
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    );