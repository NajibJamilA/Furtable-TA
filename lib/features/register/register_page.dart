import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furtable/features/register/register_controller.dart';
import 'package:furtable/utils/widget/loading_indicator.dart';
import 'package:get/get.dart';

import '../../routes/page_names.dart';
import '../../theme.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<RegisterController>(
      builder: (controller) {
        return LoadingIndicator(
          isLoading: controller.isLoading.value,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
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
                  child: const Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Register',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.lightColor
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text(
                            'Buat akunmu sekarang juga!',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: AppColors.lightColor
                            ),
                          )
                        ],
                      )
                  ),
                ),
                Container(
                  width: Get.width,
                  height: Get.height,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  margin: EdgeInsets.only(top: Get.height * 0.18),
                  decoration: const BoxDecoration(
                    color: AppColors.lightBackgroundColor,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: Get.width,
                        height: 50,
                        child: TextField(
                          cursorColor: AppColors.primaryColor,
                          style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.normal
                          ),
                          controller: controller.name,
                          decoration: InputDecoration(
                              hintText: 'Nama Lengkap',
                              prefixIcon: Container(
                                width: 40,
                                height: 40,
                                margin: const EdgeInsets.fromLTRB(5, 5, 12, 5),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: AppColors.lightColor,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: SvgPicture.asset(
                                  'assets/images/icon_username.svg',
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                              hintStyle: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.greyColor,
                                  fontWeight: FontWeight.normal
                              ),
                              fillColor: AppColors.secondaryColor,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              )
                          ),
                        ),
                      ),
                      const SizedBox(height: 16,),
                      SizedBox(
                        width: Get.width,
                        height: 50,
                        child: TextField(
                          cursorColor: AppColors.primaryColor,
                          style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.normal
                          ),
                          controller: controller.email,
                          decoration: InputDecoration(
                              hintText: 'Alamat Email',
                              prefixIcon: Container(
                                width: 40,
                                height: 40,
                                margin: const EdgeInsets.fromLTRB(5, 5, 12, 5),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: AppColors.lightColor,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: SvgPicture.asset(
                                  'assets/images/icon_email.svg',
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                              hintStyle: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.greyColor,
                                  fontWeight: FontWeight.normal
                              ),
                              fillColor: AppColors.secondaryColor,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              )
                          ),
                        ),
                      ),
                      const SizedBox(height: 16,),
                      SizedBox(
                        width: Get.width,
                        height: 50,
                        child: TextField(
                          cursorColor: AppColors.primaryColor,
                          controller: controller.phone,
                          style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.normal
                          ),
                          decoration: InputDecoration(
                              hintText: 'Nomor Telepon',
                              prefixIcon: Container(
                                width: 40,
                                height: 40,
                                margin: const EdgeInsets.fromLTRB(5, 5, 12, 5),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: AppColors.lightColor,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: SvgPicture.asset(
                                  'assets/images/icon_phone_primary.svg',
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                              hintStyle: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.greyColor,
                                  fontWeight: FontWeight.normal
                              ),
                              fillColor: AppColors.secondaryColor,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              )
                          ),
                        ),
                      ),
                      const SizedBox(height: 16,),
                      SizedBox(
                        width: Get.width,
                        height: 50,
                        child: TextField(
                          cursorColor: AppColors.primaryColor,
                          style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.normal
                          ),
                          obscureText: controller.isObscure.value,
                          controller: controller.password,
                          decoration: InputDecoration(
                              hintText: 'Kata Sandi',
                              prefixIcon: Container(
                                width: 40,
                                height: 40,
                                margin: const EdgeInsets.fromLTRB(5, 5, 12, 5),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: AppColors.lightColor,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: SvgPicture.asset(
                                  'assets/images/icon_password.svg',
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  controller.isObscure.value
                                      ? controller.isObscure.value = false
                                      : controller.isObscure.value = true;
                                },
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  padding: const EdgeInsets.all(4),
                                  margin: const EdgeInsets.fromLTRB(5, 5, 12, 5),
                                  child: SvgPicture.asset(
                                    controller.isObscure.value
                                        ? 'assets/images/icon_slashed_eye.svg'
                                        : 'assets/images/icon_eye.svg',
                                  ),
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                              hintStyle: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.greyColor,
                                  fontWeight: FontWeight.normal
                              ),
                              fillColor: AppColors.secondaryColor,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              )
                          ),
                        ),
                      ),
                      const SizedBox(height: 16,),
                      SizedBox(
                        width: Get.width,
                        height: 50,
                        child: TextField(
                          cursorColor: AppColors.primaryColor,
                          style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.normal
                          ),
                          controller: controller.passwordConfirmation,
                          obscureText: controller.isObscure2.value,
                          decoration: InputDecoration(
                              hintText: 'Konfirmasi Kata Sandi',
                              prefixIcon: Container(
                                width: 40,
                                height: 40,
                                margin: const EdgeInsets.fromLTRB(5, 5, 12, 5),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: AppColors.lightColor,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: SvgPicture.asset(
                                  'assets/images/icon_password.svg',
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  controller.isObscure2.value
                                      ? controller.isObscure2.value = false
                                      : controller.isObscure2.value = true;
                                },
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  padding: const EdgeInsets.all(4),
                                  margin: const EdgeInsets.fromLTRB(5, 5, 12, 5),
                                  child: SvgPicture.asset(
                                    controller.isObscure2.value
                                        ? 'assets/images/icon_slashed_eye.svg'
                                        : 'assets/images/icon_eye.svg',
                                  ),
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                              hintStyle: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.greyColor,
                                  fontWeight: FontWeight.normal
                              ),
                              fillColor: AppColors.secondaryColor,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              )
                          ),
                        ),
                      ),
                      const SizedBox(height: 14,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.isChecked.value == false
                                  ? controller.isChecked.value = true
                                  : controller.isChecked.value = false;
                            },
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: controller.isChecked.value
                                    ? const Color(0xFF2BBD54)
                                    : AppColors.lightColor,
                                border: Border.all(
                                  color: controller.isChecked.value
                                    ? Colors.transparent
                                    : const Color(0xFFC4C4C4),
                                  width: 1.5
                                )
                              ),
                              child: const Icon(
                                Icons.check,
                                color: AppColors.lightColor,
                                size: 15,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Flexible(
                            child: RichText(
                              text: TextSpan(
                                text: 'Dengan mendaftar, anda berarti menyetujui ',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.greyColor
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'kebijakan ketentuan layanan ',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primaryColor,
                                      fontSize: 12
                                    ),
                                    recognizer: TapGestureRecognizer()..onTap = () {

                                    }
                                  ),
                                  const TextSpan(
                                    text: 'dan ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.greyColor
                                    ),
                                  ),
                                  TextSpan(
                                      text: 'kebijakan privasi',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.primaryColor,
                                          fontSize: 12
                                      ),
                                      recognizer: TapGestureRecognizer()..onTap = () {

                                      }
                                  ),
                                ]
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 40,),
                      SizedBox(
                        width: Get.width,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              )
                          ),
                          onPressed: () async {
                            await controller.createUserWithEmailAndPassword(
                                email: controller.email.text,
                                password: controller.password.text,
                                passwordConfirmation: controller.passwordConfirmation.text,
                                name: controller.name.text,
                                phone: controller.phone.text
                            );
                          },
                          child: const Center(
                              child: Text(
                                'Daftar Sekarang',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.lightColor
                                ),
                              )
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: RichText(
                              text: TextSpan(
                                  text: 'Sudah memiliki akun? ',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: AppColors.greyColor,
                                      fontWeight: FontWeight.normal
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Login',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()..onTap = () {
                                          Get.toNamed(PageNames.LOGIN);
                                        }
                                    )
                                  ]
                              ),
                            )
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
