import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key, required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
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
                Text(
                  title,
                  style: const TextStyle(
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
          padding: const EdgeInsets.all(20),
          margin: EdgeInsets.only(top: Get.height * 0.15),
          decoration: const BoxDecoration(
            color: AppColors.lightBackgroundColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        )
      ],
    );
  }
}
