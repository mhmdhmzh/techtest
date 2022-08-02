import 'package:get/get.dart';
import 'package:techtest/models/tile_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techtest/services/tile_data_service.dart';

class TileDataController extends GetxController {
  var isLoading = true.obs;
  TileDataModel? tileDataModel;

  @override
  void onInit() {
    getTileData();
    super.onInit();
  }

  void getTileData() async {
    isLoading(true);

    final tileData = await TileDataServices.getTileData();
    print('awoawok $tileData');
    // if (tileData) {
    tileDataModel = tileData;
    print('ahihihiy ${tileDataModel!.data}');
    isLoading(false);
    update();
    // } else {
    //   print('error');
    //   isLoading(false);
    //   update();
    // }
  }
}
