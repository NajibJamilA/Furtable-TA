import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furtable/features/detail_product/detail_product_controller.dart';
import 'package:furtable/routes/page_names.dart';
import 'package:furtable/theme.dart';
import 'package:furtable/utils/helper/currency_format.dart';
import 'package:get/get.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<DetailProductController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.lightColor,
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor.withOpacity(0.1),
            title: const Text(
              'Detail Product',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppColors.darkColor
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: () {
                Get.back();
              },
            ),
            scrolledUnderElevation: 0.0,
          ),
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Stack(
              children: [
                Container(
                  width: Get.width,
                  height: 290,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.1)
                  ),
                  child: Column(
                    children: [
                      CarouselSlider.builder(
                        itemCount: controller.dummyProducts.length,
                        options: CarouselOptions(
                            autoPlay: false,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              controller.currentIndex.value = index;
                            }
                        ),
                        itemBuilder: (context, itemIndex, pageViewIndex) {
                          return Image.asset(
                            controller.furnitureList[0].name == 'Suji Rak'
                                ? controller.dummyProducts2[itemIndex]
                                : controller.dummyProducts[itemIndex]
                          );
                        },
                      ),
                      SizedBox(
                        width: Get.width,
                        height: 10,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: controller.dummyProducts.asMap().entries.map((entry) {
                              return GestureDetector(
                                onTap: () {
                                  controller.carouselController.animateToPage(entry.key);
                                },
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  margin: const EdgeInsets.only(right: 6),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: controller.currentIndex.value == entry.key
                                          ? AppColors.primaryColor
                                          : Colors.transparent,
                                      border: Border.all(
                                        color: controller.currentIndex.value == entry.key
                                            ? Colors.transparent
                                            : AppColors.greyColor,
                                      )
                                  ),
                                ),
                              );
                            }).toList()
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: Get.width,
                      margin: EdgeInsets.only(top: Get.height * 0.32),
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: AppColors.lightBackgroundColor,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                controller.furnitureList[0].type,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.greyColor
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.star,
                                color: AppColors.goldColor,
                                size: 24,
                              ),
                              const SizedBox(width: 2,),
                              Text(
                                controller.furnitureList[0].rating.toString(),
                                style: const TextStyle(
                                    color: AppColors.greyColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 4,),
                          Text(
                            controller.furnitureList[0].name,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkColor
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            CurrencyFormat.convertToIdr(controller.furnitureList[0].price),
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkColor
                            ),
                          ),
                          SizedBox(height: 4,),
                          Text(
                            'Hangat dan ramah, rapi dan bergaya. Bantal kursi penyangga, sarung yang lembut dan pelengkap yang ketat membuat kursi ini memiliki keseimbangan sempurna antara kenyamanan, fungsi, dan tampilan.',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: AppColors.greyColor
                            ),
                          ),
                          SizedBox(height: 12,),
                          Text(
                            'Bahan',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkColor
                            ),
                          ),
                          SizedBox(height: 4,),
                          Text(
                            'Sofa premium terbuat dari kayu mahoni pilihan sehingga membuat sofa menjadi tahan lama.',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: AppColors.greyColor
                            ),
                          ),
                          SizedBox(height: 12,),
                          Text(
                            'Kain',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkColor
                            ),
                          ),
                          SizedBox(height: 4,),
                          Text(
                            '100% poliester',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: AppColors.greyColor
                            ),
                          ),
                          SizedBox(height: 12,),
                          Text(
                            'Bantalan belakang',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkColor
                            ),
                          ),
                          SizedBox(height: 4,),
                          Text(
                            'Isi poliester, Busa poliuretana 25 kg/meter kubik',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: AppColors.greyColor
                            ),
                          ),
                          SizedBox(height: 12,),
                          Text(
                            'Rangka sandaran dan tempat duduk',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkColor
                            ),
                          ),
                          SizedBox(height: 4,),
                          Text(
                            'Kayu lapis, Particleboard, Kayu solid, Fibreboard',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: AppColors.greyColor
                            ),
                          ),
                          SizedBox(height: 12,),
                          Text(
                            'Rangka sandaran tangan',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkColor
                            ),
                          ),
                          SizedBox(height: 4,),
                          Text(
                            'Kayu lapis, Particleboard, Busa poliuretana 25 kg/meter kubik, Kayu solid, Fibreboard',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: AppColors.greyColor
                            ),
                          ),
                          SizedBox(height: 12,),
                          Text(
                            'Bantalan tempat duduk',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkColor
                            ),
                          ),
                          SizedBox(height: 4,),
                          Text(
                            'Isi poliester, Busa poliuretana elastis tinggi (busa dingin) 35 kg/meter kubik',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: AppColors.greyColor
                            ),
                          ),
                          SizedBox(height: 12,),
                          Text(
                            'Ukuran',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkColor
                            ),
                          ),
                          SizedBox(height: 4,),
                          Text(
                            'Lebar: 204 cm\nKedalaman: 89 cm\nTinggi: 78 cm\nTinggi sandaran tangan: 64 cm\nLebar dudukan: 180 cm\nKedalaman dudukan: 61 cm\nTinggi dudukan: 44 cm',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: AppColors.greyColor
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Container(
                        width: Get.width,
                        decoration: const BoxDecoration(
                          color: AppColors.lightBackgroundColor,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 20, left: 20, top: 20),
                              child: Row(
                                children: [
                                  Text(
                                    'Penilaian Produk',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.darkColor
                                    ),
                                  ),
                                  SizedBox(width: 4,),
                                  Text(
                                    '(15 ulasan)',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.greyColor
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Lihat Semua',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.primaryColor
                                    ),
                                  ),
                                  SizedBox(width: 2,),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: AppColors.primaryColor,
                                    size: 16,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 18,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  const Text(
                                    '5/5',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                        color: AppColors.darkColor
                                    ),
                                  ),
                                  SizedBox(
                                    width: 96,
                                    height: 20,
                                    child: ListView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      padding: const EdgeInsets.symmetric(horizontal: 6),
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: 5,
                                      itemBuilder: (context, index) {
                                        return const Icon(
                                          Icons.star,
                                          color: AppColors.goldColor,
                                          size: 13,
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 18,),
                            SizedBox(
                              width: Get.width,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Container(
                                      width: Get.width,
                                      color: AppColors.lightColor,
                                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                image: const DecorationImage(
                                                    image: AssetImage('assets/images/image_user.png'),
                                                    fit: BoxFit.fill
                                                )
                                            ),
                                          ),
                                          const SizedBox(width: 10,),
                                          SizedBox(
                                            width: Get.width * 0.75,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Yasser',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold,
                                                      color: AppColors.darkColor
                                                  ),
                                                ),
                                                const SizedBox(height: 6,),
                                                SizedBox(
                                                  width: 96,
                                                  height: 20,
                                                  child: ListView.builder(
                                                    physics: const NeverScrollableScrollPhysics(),
                                                    padding: const EdgeInsets.only(right: 6),
                                                    scrollDirection: Axis.horizontal,
                                                    shrinkWrap: true,
                                                    itemCount: 5,
                                                    itemBuilder: (context, index) {
                                                      return const Icon(
                                                        Icons.star,
                                                        color: AppColors.goldColor,
                                                        size: 13,
                                                      );
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(height: 6,),
                                                const Text(
                                                  'Produk sesuai dengan gambar, bahan berkualitas tinggi, mantap.',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.normal,
                                                      color: AppColors.greyColor
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        )
                    )
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: AppColors.lightColor,
            surfaceTintColor: AppColors.lightColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        )
                    ),
                    onPressed: () {
                      Get.toNamed(PageNames.AR, arguments: {
                        'furniture' : controller.furnitureList
                      });
                    },
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/icon_scan.svg',
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 4,),
                          const Text(
                            'Lihat AR',
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        )
                    ),
                    onPressed: () {
                      Get.toNamed(
                          PageNames.PAYMENT,
                          arguments: {
                            'furniture' : controller.furnitureList,
                            'from_home' : false
                          }
                      );
                    },
                    child: const Center(
                        child: Text(
                          'Beli Sekarang',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.lightColor
                          ),
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
