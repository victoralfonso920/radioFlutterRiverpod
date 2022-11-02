import '../../data/remote/dto/radio_item_dto.dart';
import '../model/radio_item.dart';
import 'mapper.dart';

class RadioItemMapper extends Mapper<List<RadioItemDto>, List<RadioItem>> {
  @override
  List<RadioItem> call(List<RadioItemDto> object) {

    final List<RadioItem> radioDataList = object
        .map(
          (value) => RadioItem(
            radioId: value.radioId ?? -1,
            name: value.name ?? "",
            urlStreaming: value.urlStreaming ?? "",
            isRadio: value.isRadio ?? false,
            urlStreamingRadio: value.urlStreamingRadio ?? "",
          ),
        ).toList();
         
        return radioDataList;
  }
}
