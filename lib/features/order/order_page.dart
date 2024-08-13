import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:furtable/features/order/finished/finished_page.dart';
import 'package:furtable/features/order/not_yet_paid/not_yet_paid_page.dart';
import 'package:furtable/features/order/order_controller.dart';
import 'package:furtable/features/order/packed/packed_page.dart';
import 'package:furtable/features/order/sent/sent_page.dart';
import 'package:get/get.dart';

import '../../theme.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
        builder: (controller) {
          return Stack(
            children: [
              Container(
                width: Get.width,
                height: 280,
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [AppColors.primaryColor, AppColors.lightPrimaryColor],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight
                  ),
                ),
                child: const Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Pesanan Saya',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.lightColor
                    ),
                  ),
                ),
              ),
              Container(
                width: Get.width,
                margin: EdgeInsets.only(top: Get.height * 0.15),
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: AppColors.lightBackgroundColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 25,
                      child: TabBar(
                          controller: controller.tabController,
                          labelPadding: EdgeInsets.zero,
                          dividerColor: Colors.transparent,
                          indicatorWeight: 0,
                          dividerHeight: 0,
                          labelColor: AppColors.primaryColor,
                          indicatorSize: TabBarIndicatorSize.tab,
                          unselectedLabelColor: AppColors.greyColor,
                          labelStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          indicator: const ShapeDecoration(
                              shape: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.primaryColor,
                                )
                              )
                          ),
                          tabs: const [
                            Tab(text: 'Belum Bayar'),
                            Tab(text: 'Dikemas'),
                            Tab(text: 'Dikirim'),
                            Tab(text: 'Selesai'),
                          ]
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Expanded(
                      child: TabBarView(
                        controller: controller.tabController,
                        children: const [
                          KeepAliveWrapper(child: NotYetPaidPage()),
                          KeepAliveWrapper(child: PackedPage()),
                          KeepAliveWrapper(child: SentPage()),
                          KeepAliveWrapper(child: FinishedPage())
                        ],
                      )
                    )
                  ],
                ),
              )
            ],
          );
        }
    );
  }
}

class KeepAliveWrapper extends StatefulWidget {
  const KeepAliveWrapper({
    super.key,
    required this.child
  });

  final Widget child;

  @override
  State<KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
