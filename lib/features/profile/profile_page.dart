import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furtable/features/profile/profile_controller.dart';
import 'package:get/get.dart';
import '../../theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ProfileController>(
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
                    'Profile',
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
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20)
                    ),
                  ),
                child: Column(
                  children: [
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 16
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.lightColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xFFDBDBDB)
                        )
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/image_dummy_user.png',
                            width: 60,
                            height: 60,
                          ),
                          const SizedBox(width: 12,),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.name.value,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.blackColor
                                  ),
                                ),
                                const SizedBox(height: 4,),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/icon_phone.svg',
                                      width: 14,
                                      height: 14,
                                    ),
                                    const SizedBox(width: 4,),
                                    Text(
                                      controller.phone.value,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.greyColor
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 12,),
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.lightColor,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.07),
                            blurRadius: 30,
                            offset: const Offset(0, 4),
                          )
                        ]
                      ),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              width: Get.width,
                              height: 33,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/icon_edit_profile.svg',
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(width: 5,),
                                  const Text(
                                    'Edit Profile',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.secondaryGreyColor,
                                      fontWeight: FontWeight.normal
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: AppColors.secondaryGreyColor,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const Divider(),
                          const SizedBox(height: 12,),
                          GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              width: Get.width,
                              height: 33,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/icon_account_security.svg',
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(width: 5,),
                                  const Text(
                                    'Keamanan Akun',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.secondaryGreyColor,
                                        fontWeight: FontWeight.normal
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: AppColors.secondaryGreyColor,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const Divider(),
                          const SizedBox(height: 12,),
                          GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              width: Get.width,
                              height: 33,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/icon_privacy_policy.svg',
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(width: 5,),
                                  const Text(
                                    'Kebijakan Privasi',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.secondaryGreyColor,
                                        fontWeight: FontWeight.normal
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: AppColors.secondaryGreyColor,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const Divider(),
                          const SizedBox(height: 12,),
                          GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              width: Get.width,
                              height: 33,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/icon_terms_service.svg',
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(width: 5,),
                                  const Text(
                                    'Ketentuan Layanan',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.secondaryGreyColor,
                                        fontWeight: FontWeight.normal
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: AppColors.secondaryGreyColor,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const Divider(),
                          const SizedBox(height: 12,),
                          GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              width: Get.width,
                              height: 33,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/icon_help_center.svg',
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(width: 5,),
                                  const Text(
                                    'Pusat Bantuan',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.secondaryGreyColor,
                                        fontWeight: FontWeight.normal
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: AppColors.secondaryGreyColor,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const Divider(),
                          const SizedBox(height: 12,),
                          GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              width: Get.width,
                              height: 33,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/icon_about_us.svg',
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(width: 5,),
                                  const Text(
                                    'Tentang Kami',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.secondaryGreyColor,
                                        fontWeight: FontWeight.normal
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: AppColors.secondaryGreyColor,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: Get.width,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              side: const BorderSide(
                                  color: AppColors.redColor
                              ),
                              backgroundColor: AppColors.lightColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () async {
                              await controller.signOut();
                            },
                            child: const Center(
                                child: Text(
                                  'Keluar Akun',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.redColor
                                  ),
                                )
                            ),
                          ),
                        ),
                      ),
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
