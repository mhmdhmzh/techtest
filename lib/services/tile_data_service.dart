import '../models/tile_data_model.dart';
import '../network/api_provider.dart';

class TileDataServices {
  static final ApiProvider _apiProvider = ApiProvider();

  static Future<TileDataModel> getTileData() async {
    final response = await _apiProvider.get(
        'https://storage.googleapis.com/mobile-flutter-test/response.json');
    print('anjay $response');
    return tileDataModelFromJson(response.toString());
  }
}
