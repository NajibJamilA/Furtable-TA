import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RequestController extends GetxController {

  List<String> bahanKainList = <String>['Bahan Fabric', 'Bahan Suede', 'Bahan Leather/Kulit', 'Bahan Velvet'];
  List<String> bahanFurnitureList = <String>['Jati Muda', 'Jati Tua', 'Mahoni'];

  String? bahanKain;
  String? bahanFurniture;
  String? panjang;
  String? lebar;
  String? lebarSandaranTangan;
  String? lebarDudukan;
  String? tinggiSofa;
  String? tinggiSandaranTangan;
  String? tinggiDudukan;

  File? image;

  @override
  void dispose() {
    image?.delete();
    update();
    super.dispose();
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      this.image = imageTemp;
      update();
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }
}