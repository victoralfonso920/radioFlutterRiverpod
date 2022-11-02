import '../../../dto/radio_item_dto.dart';
import '../../params/keys_params.dart';
import '../../params/queries.dart';
import '../../provider/api_provider.dart';

abstract class GetDataRadio {
  Future<List<RadioItemDto>> getDataRadio();
}

class GetDataRadioImpl implements GetDataRadio {

  final ApiProvider apiProvider;

  GetDataRadioImpl({required this.apiProvider});

  @override
  Future<List<RadioItemDto>> getDataRadio() async {

     final Map<String, dynamic> headers = {
      'Content-Type': 'application/json'
    };
      final Map<String, dynamic> params = {
      prefix: streamingOs,
      os: osNumber,
    };

    final List<dynamic> response = await apiProvider.getListFromMap(sufixDataRadios, params, headers);
    final result = response.map((e) => RadioItemDto.fromJson(e)).toList();
    
    return result;
  }
}