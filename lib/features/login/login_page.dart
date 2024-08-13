import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furtable/features/login/login_controller.dart';
import 'package:furtable/utils/widget/loading_indicator.dart';
import 'package:get/get.dart';
import '../../routes/page_names.dart';
import '../../theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<LoginController>(
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
                          'Login',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.lightColor
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text(
                          'Selamat datang kembali di Aplikasi Furtable!',
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
                          controller: controller.emailController,
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
                          controller: controller.passwordController,
                          style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.normal
                          ),
                          obscureText: controller.isObscure.value,
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
                      const SizedBox(height: 12,),
                      GestureDetector(
                        onTap: () {},
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Lupa Kata sandi?',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14
                            ),
                          ),
                        ),
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
                            await controller.signInWithEmailAndPassword(
                                email: controller.emailController.text,
                                password: controller.passwordController.text
                            );
                          },
                          child: const Center(
                              child: Text(
                                'Masuk',
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
                              text: 'Belum memiliki akun? ',
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.greyColor,
                                fontWeight: FontWeight.normal
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Daftar Sekarang',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()..onTap = () {
                                    Get.toNamed(PageNames.REGISTER);
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
