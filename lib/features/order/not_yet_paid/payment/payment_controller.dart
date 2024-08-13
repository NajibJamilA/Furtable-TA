import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:furtable/models/furniture.dart';
import 'package:get/get.dart';

import '../../../../models/bank.dart';

class PaymentController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  User? user;
  DocumentSnapshot? userDoc;


  RxInt index = 0.obs;
  List<Bank> bankList = [
    Bank(
        index: 0,
        name: 'BCA',
        imagePath: 'assets/images/image_bca.png'
    ),
    Bank(
        index: 1,
        name: 'BRI',
        imagePath: 'assets/images/image_bri.png'
    ),
    Bank(
        index: 2,
        name: 'Mandiri',
        imagePath: 'assets/images/image_mandiri.png'
    ),
  ];

  List<Furniture> listFurniture = [];

  int shippingCost = 250000;

  RxBool firstBuy = false.obs;
  RxBool fromHome = false.obs;
  String? alamatPengiriman;

  @override
  void onInit() async {
    if (!Get.arguments['from_home']) {
      listFurniture = Get.arguments['furniture'];
    }
    fromHome.value = Get.arguments['from_home'];
    user = auth.currentUser;
    update();
    super.onInit();
  }
}