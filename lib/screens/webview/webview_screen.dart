import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class WebViewScreen extends StatelessWidget {
  WebViewScreen({
    required this.title,
    required this.url,
  });
  final String? title, url;
  InAppWebViewController? webViewController;

  RxBool isFinishedLoading = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Obx(
        // for a better UX
        (() => ModalProgressHUD(
              color: Colors.white,
              opacity: 1,
              inAsyncCall: isFinishedLoading.value,
              progressIndicator: Center(
                child: Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      Text('Loading page ...')
                    ],
                  ),
                ),
              ),
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse(url!),
                ),
                onLoadStop: (controller, url) {
                  isFinishedLoading.value = false;
                },
              ),
            )),
      ),
    );
  }
}
