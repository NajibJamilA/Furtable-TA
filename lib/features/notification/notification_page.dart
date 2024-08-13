import 'package:flutter/material.dart';
import 'package:furtable/features/notification/notification_controller.dart';
import 'package:get/get.dart';

import '../../theme.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      builder: (controller) {
        return Scaffold(
          body: Stack(
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
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: AppColors.lightColor,
                          size: 24,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      const SizedBox(height: 12,),
                      const Text(
                        'Notifikasi',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColors.lightColor
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: Get.width,
                height: Get.height,
                margin: EdgeInsets.only(top: Get.height * 0.15),
                decoration: const BoxDecoration(
                  color: AppColors.lightBackgroundColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
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
                                      'Pesanan Telah Dikirim',
                                      style: TextStyle(
                                          color: AppColors.blackColor,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    SizedBox(height: 6,),
                                    Text(
                                      'Pesananmu telah dikirimkan, silahkan cek rincian dan lacak pesanannya.',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.greyColor
                                      ),
                                    ),
                                    SizedBox(height: 8,),
                                    Text(
                                      '5 jam yang lalu',
                                      style: TextStyle(
                                          fontSize: 12,
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
                        const SizedBox(height: 14,),
                        Visibility(
                          visible: index != 4? true : false,
                          child: const Column(
                            children: [
                              Divider(),
                              SizedBox(height: 14,),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
