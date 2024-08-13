import 'package:furtable/features/request/detail_request/detail_request_controller.dart';
import 'package:get/get.dart';

class DetailRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailRequestController>(() => DetailRequestController());
  }
}