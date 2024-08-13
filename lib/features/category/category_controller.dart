import 'package:get/get.dart';

import '../../models/furniture.dart';

class CategoryController extends GetxController {
  RxList<Furniture> furnitureList = <Furniture>[].obs;

  @override
  void onInit() {
    furnitureList.addAll(Get.arguments['furniture']);
    super.onInit();
  }
}