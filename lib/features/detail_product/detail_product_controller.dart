import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

import '../../models/furniture.dart';

class DetailProductController extends GetxController {
  List<String> dummyProducts = [
    'assets/images/image_dummy_product_right.png',
    'assets/images/image_dummy_product_left.png'
  ];

  List<String> dummyProducts2 = [
    'assets/images/image_rack_left.png',
    'assets/images/image_rack_right.png',
  ];

  List<Furniture> furnitureList = [];

  final CarouselController carouselController = CarouselController();
  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    furnitureList.add(Get.arguments);
    update();
    super.onInit();
  }
}