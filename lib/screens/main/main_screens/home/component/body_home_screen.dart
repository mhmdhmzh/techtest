import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techtest/controllers/tile_data_controller.dart';
import 'package:techtest/reusable_components/size_component.dart';
import 'package:techtest/reusable_components/tile_component.dart';
import '../../../../webview/webview_screen.dart';

class BodyHome extends StatelessWidget {
  BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TileDataController tileDataController = Get.put(TileDataController());
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Campaigns',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              VerticalGap(10),
              GetBuilder<TileDataController>(
                initState: (_) => Get.find<TileDataController>().getTileData(),
                builder: (controller) {
                  return controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : SizedBox(
                          child: GridView.count(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            crossAxisSpacing: 11,
                            childAspectRatio: 1 / 1.3,
                            children: [
                              for (var s in controller.tileDataModel!.data!)
                                TileComponent(
                                  title: s.title!,
                                  imageUrl: s.urlImage!,
                                  onTap: () => Get.to(WebViewScreen(
                                    title: s.title,
                                    url: s.urlWebview,
                                  )),
                                ),
                            ],
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
