import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furtable/features/bottom_navigation_bar/bottom_navigation_bar_controller.dart';
import 'package:furtable/features/order/order_page.dart';
import 'package:furtable/features/profile/profile_page.dart';
import 'package:furtable/features/track/track_page.dart';
import 'package:get/get.dart';
import '../../theme.dart';
import '../home/home_page.dart';

class BottomNavigationBarPage extends StatelessWidget {
  const BottomNavigationBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<BottomNavigationBarController>(
      builder: (controller) {
        return Scaffold(
          body: PopScope(
            canPop: controller.canPop.value,
            onPopInvoked: controller.onPopInvoked,
            child: IndexedStack(
              index: controller.currentIndex.value,
              children: const [
                HomePage(),
                OrderPage(),
                TrackPage(),
                ProfilePage(),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            height: 68,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 30,
                      spreadRadius: 0,
                      color: AppColors.dropShadowColor.withOpacity(0.03),
                      offset: const Offset(0, -10)
                  )
                ]
            ),
            child: BottomNavigationBar(
              onTap: (value) {
                controller.currentIndex.value = value;
              },
              currentIndex: controller.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: const TextStyle(
                color: AppColors.primaryColor,
                fontSize: 11,
                fontWeight: FontWeight.w600
              ),
              unselectedLabelStyle: const TextStyle(
                  color: AppColors.secondaryGreyColor,
                  fontSize: 11,
                  fontWeight: FontWeight.w600
              ),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: AppColors.secondaryGreyColor,
              items: [
                BottomNavigationBarItem(
                    icon: controller.currentIndex.value == 0?
                    SvgPicture.asset(
                      'assets/images/icon_home_primary.svg',
                      width: 24,
                      height: 24,
                    )
                        :
                    SvgPicture.asset(
                      'assets/images/icon_home_secondary.svg',
                      width: 24,
                      height: 24,
                    ),
                    label: 'Home'
                ),
                BottomNavigationBarItem(
                    icon: controller.currentIndex.value == 1?
                    SvgPicture.asset(
                      'assets/images/icon_order_primary.svg',
                      width: 24,
                      height: 24,
                    )
                        :
                    SvgPicture.asset(
                      'assets/images/icon_order_secondary.svg',
                      width: 24,
                      height: 24,
                    ),
                    label: 'Pesanan'
                ),
                BottomNavigationBarItem(
                    icon: controller.currentIndex.value == 2?
                    SvgPicture.asset(
                      'assets/images/icon_track_primary.svg',
                      width: 24,
                      height: 24,
                    )
                        :
                    SvgPicture.asset(
                      'assets/images/icon_track_secondary.svg',
                      width: 24,
                      height: 24,
                    ),
                    label: 'Lacak'
                ),
                BottomNavigationBarItem(
                    icon: controller.currentIndex.value == 3?
                    SvgPicture.asset(
                      'assets/images/icon_profile_primary.svg',
                      width: 24,
                      height: 24,
                    )
                        :
                    SvgPicture.asset(
                      'assets/images/icon_profile_secondary.svg',
                      width: 24,
                      height: 24,
                    ),
                    label: 'Profil'
                )
              ],
            ),
          ),
        );
      },
    );
  }
}


