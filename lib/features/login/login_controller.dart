import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furtable/models/auth.dart';
import 'package:get/get.dart';
import '../../routes/page_names.dart';
import '../../theme.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Auth auth = Auth();
  final User? user = Auth().currentUser;

  RxString errorMessage = ''.obs;
  RxBool isObscure = true.obs;
  RxBool isLoading = false.obs;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password
  }) async {
    isLoading.value = true;
    try {
      await auth.firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      Fluttertoast.showToast(
          msg: 'Login Berhasil!',
          backgroundColor: AppColors.primaryColor
      );
      Get.offAllNamed(PageNames.BOTTOM_NAVIGATION_BAR);
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: 'Login Gagal!',
          backgroundColor: AppColors.primaryColor
      );
      errorMessage.value = e.message!;
    }
    isLoading.value = false;
  }
}