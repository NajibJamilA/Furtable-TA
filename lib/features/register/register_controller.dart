import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furtable/models/auth.dart';
import 'package:get/get.dart';

import '../../routes/page_names.dart';
import '../../theme.dart';

class RegisterController extends GetxController {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController passwordConfirmation = TextEditingController();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final Auth auth = Auth();

  RxBool isLoading = false.obs;
  RxBool isChecked = false.obs;
  RxBool isObscure = true.obs;
  RxBool isObscure2 = true.obs;
  RxString errorMessage = ''.obs;

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String passwordConfirmation,
    required String name,
    required String phone,
  }) async {
    isLoading.value = true;
    try {
      if(password == passwordConfirmation) {
        final UserCredential userCredential = await auth.firebaseAuth.createUserWithEmailAndPassword(
            email: email,
            password: password
        );
        await firestore.collection('users').doc(userCredential.user?.uid).set({
          'name' : name,
          'email' : email,
          'phone' : phone
        });
        Fluttertoast.showToast(
            msg: 'Register Berhasil!',
            backgroundColor: AppColors.primaryColor
        );
        Get.toNamed(PageNames.LOGIN);
      } else {
        Fluttertoast.showToast(
            msg: 'Konfirmasi password tidak sesuai!',
            backgroundColor: AppColors.primaryColor
        );
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: 'Register Gagal!',
          backgroundColor: AppColors.primaryColor
      );
      errorMessage.value = e.message!;
    }
    isLoading.value = false;
  }
}