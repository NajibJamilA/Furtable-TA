import 'package:flutter/material.dart';
import 'package:furtable/utils/widget/timeline_widget.dart';
import 'package:get/get.dart';
import 'package:furtable/features/track/track_controller.dart';

import '../../theme.dart';

class TrackPage extends StatelessWidget {
  const TrackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<TrackController>(
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Visibility(
                  visible: Get.arguments != null ? true : false,
                  child: Container(
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
                          const SizedBox(width: 10,),
                          const Text(
                            'Lacak Pesanan',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.lightColor
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: Get.arguments != null ? false : true,
                  child: Container(
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
                        'Lacak Pesanan',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.lightColor
                        ),
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
                  child: controller.isOrder.value
                      ? Column(
                    children: [
                      Row(
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
                                  'Estimasi diterima tanggal',
                                  style: TextStyle(
                                      color: AppColors.blackColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14
                                  ),
                                ),
                                const SizedBox(height: 4,),
                                Text(
                                  '${controller.trackDate}',
                                  style: const TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14
                                  ),
                                ),
                                const SizedBox(height: 4,),
                                const Text(
                                  'Sabar, tenang, dan cek selalu!',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.greyColor
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                      const SizedBox(height: 14,),
                      const Divider(),
                      const TimelineWidget(
                        isFirst: true,
                        isLast: false,
                        isPast: true,
                        title: 'Pesanan Dibuat',
                        subtitle: 'Pesanan telah dibuat',
                      ),
                      const TimelineWidget(
                        isFirst: false,
                        isLast: false,
                        isPast: true,
                        title: 'Pesanan Dikemas',
                        subtitle: 'Pesanan dikemas dan akan segera dikirimkan',
                      ),
                      const TimelineWidget(
                        isFirst: false,
                        isLast: false,
                        isPast: false,
                        title: 'Pesanan Dikirimkan',
                        subtitle: 'Pesanan dikirimkan dan akan menuju ke Cilacap Kota',
                      ),
                      const TimelineWidget(
                        isFirst: false,
                        isLast: false,
                        isPast: false,
                        title: 'Pesanan Dikirimkan',
                        subtitle: 'Pesanan telah sampai Cilacap Kota dan akan dilanjutkan menuju Bandung',
                      ),
                      const TimelineWidget(
                        isFirst: false,
                        isLast: false,
                        isPast: false,
                        title: 'Pesanan Dikirimkan',
                        subtitle: 'Pesanan telah sampai Bandung dan akan diantar ketempat tujuanmu',
                      ),
                      const TimelineWidget(
                        isFirst: false,
                        isLast: true,
                        isPast: false,
                        title: 'Pesanan Menuju Tempatmu',
                        subtitle: 'Bersiap untuk menerima furniture yang anda pesan, cek kembali pesanan anda!',
                      )
                    ],
                  )
                      : Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.2,
                      ),
                      Image.asset(
                        'assets/images/image_no_track.png',
                        width: 200,
                        height: 200,
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
