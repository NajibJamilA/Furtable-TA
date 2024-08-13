import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furtable/routes/page_names.dart';
import 'package:get/get.dart';

import '../../theme.dart';

class ProfileController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  User? user;
  DocumentSnapshot? userDoc;

  RxString name = ''.obs;
  RxString phone = ''.obs;

  @override
  void onInit() async {
    user = auth.currentUser;
    userDoc = await firestore.collection('users').doc(user?.uid).get();
    name.value = userDoc?['name'];
    phone.value = userDoc?['phone'];
    super.onInit();
  }

  Future<void> signOut() async {
    await auth.signOut();
    Fluttertoast.showToast(
        msg: 'Logout Berhasil!',
        backgroundColor: AppColors.primaryColor
    );
    Get.offAllNamed(PageNames.LOGIN);
  }
}