import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  List<String> imageList = [
    'assets/images/image_ob_1.png',
    'assets/images/image_ob_2.png'
  ].obs;

  List<Map<String, dynamic>> onBoardingList = [
    {
      'image' : 'assets/images/image_ob_1.png',
      'title' : 'Kualitas Terjamin, Harga Terjangkau',
      'subtitle' : 'Kami menjamin bahwa furniture yang ada di furtable mempunyai kualitas dengan nilai terbaik, dan telah diseleksi.',
      'button_text' : 'Selanjutnya'
    },
    {
      'image' : 'assets/images/image_ob_2.png',
      'title' : 'Tampak lebih nyata dengan fitur Augmented Reality',
      'subtitle' : 'Pilih furniture sesuai suasana rumah dengan fitur Augmented Reality yang dapat membuat benda semakin terasa nyata denganmu.',
      'button_text' : 'Mulai Sekarang'
    }
  ];

  CarouselController carouselController = CarouselController();
  RxInt currentIndex = 0.obs;
}