import 'package:furtable/features/request/detail_request_success/detail_request_success_controller.dart';
import 'package:get/get.dart';

class DetailRequestSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailRequestSuccessController>(() => DetailRequestSuccessController());
  }
}