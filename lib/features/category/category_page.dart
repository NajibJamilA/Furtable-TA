import 'package:flutter/material.dart';
import 'package:furtable/features/category/category_controller.dart';
import 'package:furtable/utils/helper/currency_format.dart';
import 'package:get/get.dart';

import '../../routes/page_names.dart';
import '../../theme.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<CategoryController>(
      builder: (controller) {
        return Scaffold(
          body: Stack(
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
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: AppColors.lightColor,
                          size: 24,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      const SizedBox(height: 12,),
                      Text(
                        Get.arguments['title']?? 'Category Title',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColors.lightColor
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: Get.width,
                height: Get.height,
                margin: EdgeInsets.only(top: Get.height * 0.15),
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: AppColors.lightBackgroundColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: GridView.builder(
                  itemCount: controller.furnitureList.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 12
                  ),
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
                                    '${controller.furnitureList[index].rating}',
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
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
