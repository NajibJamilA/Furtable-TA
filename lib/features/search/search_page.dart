import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furtable/features/search/search_controller.dart';
import 'package:get/get.dart';

import '../../routes/page_names.dart';
import '../../theme.dart';
import '../../utils/helper/currency_format.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<SearchControllerx>(
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
                        Flexible(
                          flex: 1,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios_rounded,
                              color: AppColors.lightColor,
                              size: 24,
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ),
                        const SizedBox(height: 12,),
                        Flexible(
                          flex: 5,
                          child: TextField(
                            onChanged: (String value) {
                              controller.search(value);
                            },
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
                        )
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          '${controller.result.length} hasil ditemukan',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkColor
                          ),
                        ),
                        GridView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: controller.result.length,
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
                                      arguments: controller.result[index]
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
                                                    controller.result[index].imagePath
                                                ),
                                                fit: BoxFit.fill
                                            )
                                        ),
                                      ),
                                      const SizedBox(height: 4,),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 12),
                                        child: Text(
                                          controller.result[index].type,
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
                                          controller.result[index].name,
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
                                              CurrencyFormat.convertToIdr(controller.result[index].price),
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
                                              controller.result[index].rating.toString(),
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
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }
    );
  }
}
