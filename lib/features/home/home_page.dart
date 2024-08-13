import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furtable/features/home/home_controller.dart';
import 'package:furtable/routes/page_names.dart';
import 'package:furtable/utils/helper/currency_format.dart';
import 'package:get/get.dart';
import '../../theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<HomeController>(
        builder: (controller) {
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Stack(
              children: [
                Container(
                  width: Get.width,
                  height: 280,
                  padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [AppColors.primaryColor, AppColors.lightPrimaryColor],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Halo,\n${controller.name.value}!',
                            style: const TextStyle(
                                fontFamily: 'Lato',
                                color: AppColors.lightColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(PageNames.NOTIFICATION);
                            },
                            child: Container(
                              width: 32,
                              height: 32,
                              margin: const EdgeInsets.only(right: 4),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.lightColor.withOpacity(0.4)
                              ),
                              child: Center(
                                  child: Stack(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/icon_notification.svg',
                                        width: 20,
                                        height: 20,
                                      ),
                                      Positioned(
                                        right: 1.0,
                                        child: Container(
                                          width: 6,
                                          height: 6,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: AppColors.lightColor,
                                              ),
                                              color: AppColors.redColor
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 4,),
                      const Text(
                        'Mari temukan Furniture terbaik bersama kami!',
                        style: TextStyle(
                          color: AppColors.lightColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 30,),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(PageNames.SEARCH, arguments: {
                            'furniture' : controller.furnitureList
                          });
                        },
                        child: SizedBox(
                          width: Get.width,
                          height: 50,
                          child: TextField(
                            enabled: false,
                            cursorColor: AppColors.primaryColor,
                            style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.normal
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(14),
                                child: SvgPicture.asset(
                                  'assets/images/icon_search.svg',
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                              hintText: 'Cari furniture anda...',
                              hintStyle: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.secondaryGreyColor,
                                  fontWeight: FontWeight.normal
                              ),
                              fillColor: AppColors.lightColor,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
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
                      const Text(
                        'Kategori',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkColor
                        ),
                      ),
                      const SizedBox(height: 14,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          category(
                              imagePath: controller.iconCategories[0],
                              title: controller.nameCategories[0],
                              onTap: () => Get.toNamed(PageNames.CATEGORY, arguments: {
                                'title' : controller.nameCategories[0],
                                'furniture' : controller.furnitureList
                                    .where((element) => element.type == 'Sofa').toList(),
                                'index' : 0,
                              })
                          ),
                          category(
                              imagePath: controller.iconCategories[1],
                              title: controller.nameCategories[1],
                              onTap: () => Get.toNamed(PageNames.CATEGORY, arguments: {
                                'title' : controller.nameCategories[1],
                                'furniture' : controller.furnitureList
                                    .where((element) => element.type == 'Ranjang').toList(),
                                'index' : 0,
                              })
                          ),
                          category(
                              imagePath: controller.iconCategories[2],
                              title: controller.nameCategories[2],
                              onTap: () => Get.toNamed(PageNames.CATEGORY, arguments: {
                                'title' : controller.nameCategories[2],
                                'furniture' : controller.furnitureList
                                    .where((element) => element.type == 'Lemari').toList(),
                                'index' : 0,
                              })
                          ),
                          category(
                              imagePath: controller.iconCategories[3],
                              title: controller.nameCategories[3],
                              onTap: () => Get.toNamed(PageNames.REQUEST)
                          ),
                          category(
                              imagePath: controller.iconCategories[4],
                              title: controller.nameCategories[4],
                              onTap: () => Get.toNamed(PageNames.CATEGORY, arguments: {
                                'title' : controller.nameCategories[4],
                                'furniture' : controller.furnitureList
                                    .where((element) => element.type != 'Sofa' && element.type != 'Ranjang' && element.type != 'Lemari').toList(),
                                'index' : 4,
                              })
                          ),
                        ],
                      ),
                      const SizedBox(height: 30,),
                      Stack(
                        children: [
                          Container(
                            width: Get.width,
                            height: 160,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/images/image_product.png'),
                                fit: BoxFit.fill
                              ),
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                          Container(
                            width: Get.width * 0.55,
                            height: 160,
                            decoration: BoxDecoration(
                                color: AppColors.lightPrimaryColor.withOpacity(0.5),
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(151),
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)
                                )
                            ),
                          ),
                          Container(
                            width: Get.width * 0.5,
                            height: 160,
                            padding: const EdgeInsets.only(left: 16),
                            decoration: BoxDecoration(
                              color: AppColors.darkColor.withOpacity(0.7),
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(151),
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)
                              )
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Penawaran spesial',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.lightColor
                                  ),
                                ),
                                const SizedBox(height: 8,),
                                Container(
                                  width: 112,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: AppColors.primaryColor
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Diskon 20%',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.lightColor
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8,),
                                const Text(
                                  '*disetiap pembelian pertama',
                                  style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.lightColor
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Produk Populer',
                            style: TextStyle(
                              color: AppColors.darkColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 18
                            ),
                          ),
                        ],
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: controller.furnitureList.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              mainAxisExtent: 221
                          ),
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                    PageNames.DETAIL_PRODUCT,
                                    arguments: controller.furnitureList[index]
                                );
                              },
                              child: Container(
                                width: 154,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.lightColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.darkColor.withOpacity(0.02),
                                      offset: const Offset(0, 10),
                                      blurRadius: 10
                                    )
                                  ]
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: Get.width,
                                      height: 141,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.vertical(
                                          bottom: Radius.circular(10)
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            controller.furnitureList[index].imagePath
                                          ),
                                          fit: BoxFit.fill
                                        )
                                      ),
                                    ),
                                    const SizedBox(height: 4,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      child: Text(
                                        controller.furnitureList[index].type,
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: AppColors.greyColor,
                                          fontWeight: FontWeight.normal
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 2,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      child: Text(
                                        controller.furnitureList[index].name,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.darkColor
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      child: Row(
                                        children: [
                                          Text(
                                            CurrencyFormat.convertToIdr(controller.furnitureList[index].price),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: AppColors.darkColor
                                            ),
                                          ),
                                          const Spacer(),
                                          const Icon(
                                            Icons.star,
                                            color: AppColors.goldColor,
                                            size: 10,
                                          ),
                                          const SizedBox(width: 2,),
                                          Text(
                                            controller.furnitureList[index].rating.toString(),
                                            style: const TextStyle(
                                              color: AppColors.greyColor,
                                              fontSize: 8,
                                              fontWeight: FontWeight.normal
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                        }
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      )
    );
  }

  Widget category({
    required String imagePath,
    required String title,
    required Function()? onTap
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
              child: SvgPicture.asset(
                imagePath,
              ),
            ),
          ),
          const SizedBox(height: 3,),
          Text(
            title,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: AppColors.darkColor
            ),
          ),
        ],
      ),
    );
  }
}
