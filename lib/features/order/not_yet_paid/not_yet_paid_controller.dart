import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class NotYetPaidController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  User? user;
  DocumentSnapshot? userDoc;

  RxBool isOrder = false.obs;
  RxInt totalPrice = 0.obs;
  RxInt initialPrice = 0.obs;
  RxString furnitureName = ''.obs;
  RxString alamatPengiriman = ''.obs;

  @override
  void onInit() async {
    user = auth.currentUser;
    userDoc = await firestore.collection('users').doc(user?.uid).get();
    isOrder.value = userDoc?['order'];
    if(isOrder.value) {
      initialPrice.value = userDoc?['product'][0]['initial_price'];
      totalPrice.value = userDoc?['product'][0]['total_price'];
      furnitureName.value = userDoc?['product'][0]['name'];
      alamatPengiriman.value = userDoc?['product'][0]['alamat_pengiriman'];
    }
    super.onInit();
  }
}