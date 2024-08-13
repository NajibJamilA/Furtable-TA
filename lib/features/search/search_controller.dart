import 'package:get/get.dart';

import '../../models/furniture.dart';

class SearchControllerx extends GetxController {
  RxString query = ''.obs;
  List<Furniture> furnitureList = <Furniture>[];
  RxList<Furniture> result = <Furniture>[].obs;

  @override
  void onInit() {
    furnitureList.addAll(Get.arguments['furniture']);
    super.onInit();
  }

  void search(String value) {
    query.value = value;
    result.value = furnitureList.where((element) => element.name.toLowerCase().contains(query.value)).toList();
    if(query.value == '') {
      result.clear();
    }
  }
}