import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../models/furniture.dart';

class HomeController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  User? user;
  DocumentSnapshot? userDoc;

  RxString name = ''.obs;

  List<String> iconCategories = [
    'assets/images/icon_sofa.svg',
    'assets/images/icon_ranjang.svg',
    'assets/images/icon_lemari.svg',
    'assets/images/icon_request.svg',
    'assets/images/icon_lainnya.svg'
  ];

  List<String> nameCategories = [
    'Sofa',
    'Ranjang',
    'Lemari',
    'Request',
    'Lainnya'
  ];

  List<Furniture> furnitureList = <Furniture>[
    Furniture(
        index: 0,
        name: 'Black Premium Sofa',
        type: 'Sofa',
        price: 3000000,
        rating: 4.6,
        imagePath: 'assets/images/image_sofa_black_small.png'
    ),
    Furniture(
        index: 1,
        name: 'Suji Rak',
        type: 'Rak Sepatu',
        price: 500000,
        rating: 4.7,
        imagePath: 'assets/images/image_suji_rak_small.png'
    ),
    Furniture(
        index: 2,
        name: 'Krem Premium Sofa',
        type: 'Sofa',
        price: 7000000,
        rating: 4.6,
        imagePath: 'assets/images/image_sofa_krem_small.png'
    ),
    Furniture(
        index: 3,
        name: 'Brimnus Lemari',
        type: 'Lemari',
        price: 5700000,
        rating: 4.7,
        imagePath: 'assets/images/image_lemari_small.png'
    ),
    Furniture(
        index: 4,
        name: 'Meja Kerja Jati Doff',
        type: 'Meja',
        price: 4500000,
        rating: 4.8,
        imagePath: 'assets/images/image_meja_small.png'
    ),
    Furniture(
        index: 5,
        name: 'Idanus Lemari',
        type: 'Rak',
        price: 7700000,
        rating: 4.5,
        imagePath: 'assets/images/image_idanus_lemari_small.png'
    ),
    Furniture(
        index: 6,
        name: 'Songlov Lemari',
        type: 'Lemari',
        price: 4600000,
        rating: 4.5,
        imagePath: 'assets/images/image_songlov_lemari_small.png'
    ),
    Furniture(
        index: 7,
        name: 'Meja Kerja Mickey',
        type: 'Meja',
        price: 2700000,
        rating: 4.7,
        imagePath: 'assets/images/image_meja_kerja_mickey_small.png'
    ),
    Furniture(
        index: 8,
        name: 'Set Meja Liqusov',
        type: 'Meja',
        price: 4700000,
        rating: 4.7,
        imagePath: 'assets/images/image_set_meja_liqusov_small.png'
    ),
    Furniture(
        index: 9,
        name: 'Kernabalu Ranjang',
        type: 'Ranjang',
        price: 3900000,
        rating: 4.8,
        imagePath: 'assets/images/image_kernabalu_ranjang_small.png'
    ),
    Furniture(
        index: 10,
        name: 'Tarva Ranjang',
        type: 'Ranjang',
        price: 1600000,
        rating: 4.7,
        imagePath: 'assets/images/image_tarva_ranjang_small.png'
    ),
    Furniture(
        index: 11,
        name: 'Sirnina Sofa',
        type: 'Sofa',
        price: 9700000,
        rating: 4.8,
        imagePath: 'assets/images/image_sirnina_sofa_small.png'
    ),
    Furniture(
        index: 12,
        name: 'Heil Rak',
        type: 'Rak Sepatu',
        price: 2700000,
        rating: 4.5,
        imagePath: 'assets/images/image_heil_rak_small.png'
    ),
    Furniture(
        index: 13,
        name: 'Helmnes Rak',
        type: 'Rak Buku',
        price: 5700000,
        rating: 4.6,
        imagePath: 'assets/images/image_helmnes_rak_small.png'
    ),
    Furniture(
        index: 14,
        name: 'Tornkvin Rak',
        type: 'Rak Dapur',
        price: 1400000,
        rating: 4.6,
        imagePath: 'assets/images/image_tornkvin_rak_small.png'
    ),
    Furniture(
        index: 15,
        name: 'Sunnersta Rak',
        type: 'Rak Dapur',
        price: 200000,
        rating: 4.6,
        imagePath: 'assets/images/image_sunnersta_rak_small.png'
    ),
  ];

  @override
  void onInit() async {
    user = auth.currentUser;
    userDoc = await firestore.collection('users').doc(user?.uid).get();
    name.value = userDoc?['name'];
    super.onInit();
  }
}