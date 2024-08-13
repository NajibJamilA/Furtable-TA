import 'package:flutter/material.dart';
import 'package:furtable/features/order/sent/sent_controller.dart';
import 'package:get/get.dart';

import '../../../routes/page_names.dart';
import '../../../theme.dart';

class SentPage extends StatelessWidget {
  const SentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<SentController>(
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
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Pesananmu sedang dikemas',
                            style: TextStyle(
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          const SizedBox(height: 6,),
                          const Text(
                            'Pesananmu sedang dibuat, mohon tunggu maksimal 7x24 jam, sabar ya!',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: AppColors.greyColor
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: SizedBox(
                              width: 137,
                              height: 46,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    )
                                ),
                                onPressed: () {
                                  Get.toNamed(PageNames.TRACK, arguments: {
                                    'title' : 'sent track'
                                  });
                                },
                                child: const Text(
                                  'Lacak',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.lightColor
                                  ),
                                ),
                              ),
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
