import 'package:flutter/material.dart';
import 'package:furtable/features/order/not_yet_paid/not_yet_paid_controller.dart';
import 'package:furtable/utils/helper/currency_format.dart';
import 'package:get/get.dart';

import '../../../routes/page_names.dart';
import '../../../theme.dart';

class NotYetPaidPage extends StatelessWidget {
  const NotYetPaidPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<NotYetPaidController>(
      builder: (controller) {
        if(controller.isOrder.value) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
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
                                'Pesanan Anda Siap Dibayar',
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              SizedBox(height: 6,),
                              Text(
                                'Pesananmu telah siap untuk dibayar, segera selesaikan pesananmu.',
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
                  ),
                  const SizedBox(height: 6,),
                  Container(
                    width: Get.width,
                    padding: const EdgeInsets.only(left: 14),
                    decoration: BoxDecoration(
                        color: AppColors.lightColor,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Total : ${CurrencyFormat
                              .convertToIdr(controller.totalPrice.value)}',
                          style: const TextStyle(
                              color: AppColors.darkBlueColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
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
                              Get.toNamed(
                                  PageNames.PAYMENT,
                                  arguments: {
                                    'from_home' : true,
                                    'furniture_name' : controller.furnitureName.value,
                                    'alamat_pengiriman' : controller.alamatPengiriman.value,
                                    'initial_price' : controller.initialPrice.value
                                  }
                              );
                            },
                            child: const Text(
                              'Bayar',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.lightColor
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
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
