import 'package:flutter_svg/svg.dart';
import 'package:furtable/features/splash/splash_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        builder: (controller) {
          return Container(
            width: Get.width,
            height: Get.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [AppColors.primaryColor, AppColors.lightPrimaryColor],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight
              )
            ),
            child: Center(
              child: Container(
                width: 122,
                height: 122,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.lightColor
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/icon_logo.svg'
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}
