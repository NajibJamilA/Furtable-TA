import 'package:flutter/material.dart';
import 'package:furtable/features/order/packed/packed_controller.dart';
import 'package:get/get.dart';

import '../../../theme.dart';

class PackedPage extends StatelessWidget {
  const PackedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<PackedController>(
      builder: (controller) {
        if(controller.isOrder.value) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                width: Get.width,
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 18
                ),
                decoration: BoxDecoration(
                    color: AppColors.lightColor,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/image_product_2.png')
                          )
                      ),
                    ),
                    const SizedBox(width: 12,),
                    const Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Pesananmu sedang dikemas',
                            style: TextStyle(
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          SizedBox(height: 6,),
                          Text(
                            'Pesananmu sedang dibuat, mohon tunggu maksimal 7x24 jam, sabar ya!',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: AppColors.greyColor
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/image_no_order.png',
                    width: 200,
                    height: 200,
                  ),
                ),
                const SizedBox(height: 10,),
                const Text(
                  'Wah belum ada pesanan nih, Ayo belanja!',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.normal
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
