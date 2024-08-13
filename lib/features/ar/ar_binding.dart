import 'package:furtable/features/ar/ar_controller.dart';
import 'package:get/get.dart';

class ARBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ARController>(() => ARController());
  }
}