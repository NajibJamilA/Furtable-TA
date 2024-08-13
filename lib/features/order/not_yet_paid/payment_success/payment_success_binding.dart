import 'package:furtable/features/order/not_yet_paid/payment_success/payment_success_controller.dart';
import 'package:get/get.dart';

class PaymentSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentSuccessController>(() => PaymentSuccessController());
  }
}