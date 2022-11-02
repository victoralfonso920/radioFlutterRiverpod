import '../mappers/radio_item_mapper.dart';
import '../model/radio_item.dart';
import '../repository/get_data_radio_repository.dart';

class GetDataRadioUseCase{
  final GetDataRadioRepository repo;

  GetDataRadioUseCase(this.repo);

   Future<List<RadioItem>> invoke() async {
    final RadioItemMapper radioMapper = RadioItemMapper();
    final result = await repo.getDataRadio();
    return radioMapper.call(result);
  }
}