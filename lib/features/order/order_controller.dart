import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController with GetSingleTickerProviderStateMixin {

  late TabController tabController;
  List<String> status = ['Belum Bayar', 'Dikemas', 'Dikirim', 'Selesai'];

  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    super.onInit();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}