import 'package:flutter/material.dart';
import 'package:furtable/features/request/detail_request_success/detail_request_success_controller.dart';
import 'package:get/get.dart';

import '../../../routes/page_names.dart';
import '../../../theme.dart';

class DetailRequestSuccessPage extends StatelessWidget {
  const DetailRequestSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailRequestSuccessController>(
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
                        'Detail Pesanan',
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
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: AppColors.lightBackgroundColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  children: [
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.secondaryColor
                      ),
                      child: const Text(
                        'Permintaan anda sudah kami konfirmasi, silahkan menunggu untuk detail harga. Cek secara berkala di menu “Pesanan” untuk detail harga. Detail harga akan keluar maksimal 1x24 jam.',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            color: AppColors.lightColor,
            surfaceTintColor: AppColors.lightColor,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  )
              ),
              onPressed: () {
                Get.offAllNamed(PageNames.BOTTOM_NAVIGATION_BAR);
              },
              child: const Center(
                  child: Text(
                    'Selesai',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.lightColor
                    ),
                  )
              ),
            ),
          ),
        );
      },
    );
  }
}
