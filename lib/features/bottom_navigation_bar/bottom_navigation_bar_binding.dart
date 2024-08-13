import 'package:furtable/features/bottom_navigation_bar/bottom_navigation_bar_controller.dart';
import 'package:furtable/features/home/home_controller.dart';
import 'package:furtable/features/order/finished/finished_controller.dart';
import 'package:furtable/features/order/order_controller.dart';
import 'package:furtable/features/order/packed/packed_controller.dart';
import 'package:furtable/features/profile/profile_controller.dart';
import 'package:furtable/features/track/track_controller.dart';
import 'package:get/get.dart';

import '../order/not_yet_paid/not_yet_paid_controller.dart';
import '../order/sent/sent_controller.dart';

class BottomNavigationBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationBarController>(() => BottomNavigationBarController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<OrderController>(() => OrderController());
    Get.lazyPut<TrackController>(() => TrackController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<NotYetPaidController>(() => NotYetPaidController());
    Get.lazyPut<PackedController>(() => PackedController());
    Get.lazyPut<SentController>(() => SentController());
    Get.lazyPut<FinishedController>(() => FinishedController());
  }

}