import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:techtest/controllers/home_controller.dart';
import 'package:techtest/controllers/tile_data_controller.dart';
import 'package:techtest/models/tile_data_model.dart';
import 'package:techtest/services/tile_data_service.dart';

void main() {
  HomePageController homePageController = HomePageController();
  TileDataController tileDataController = TileDataController();
  test('Initial page check', () {
    expect(homePageController.currentIndex, 0);
  });

  test('Loading boolean check', () {
    expect(tileDataController.isLoading.value, true);
  });
}
