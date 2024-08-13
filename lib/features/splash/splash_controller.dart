import 'dart:async';

import 'package:furtable/main.dart';
import 'package:furtable/routes/page_names.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 2), () {
      introduction == 0
          ? Get.toNamed(PageNames.ON_BOARDING)
          : Get.toNamed(PageNames.AUTH_GATE);
    });
    super.onInit();
  }
}