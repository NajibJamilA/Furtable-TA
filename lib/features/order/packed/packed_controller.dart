import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PackedController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  User? user;
  DocumentSnapshot? userDoc;

  RxBool isOrder = false.obs;

  @override
  void onInit() async {
    user = auth.currentUser;
    userDoc = await firestore.collection('users').doc(user?.uid).get();
    isOrder.value = userDoc?['order'];
    super.onInit();
  }
}