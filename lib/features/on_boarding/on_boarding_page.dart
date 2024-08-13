import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/page_names.dart';
import '../../theme.dart';
import 'on_boarding_controller.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
      builder: (controller) {
        return Scaffold(
          body: CarouselSlider.builder(
            itemCount: 2,
            carouselController: controller.carouselController,
            itemBuilder: (context, index, realIndex) {
              return Stack(
                children: [
                  Container(
                    width: Get.width,
                    height: Get.height,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              controller.onBoardingList[index]['image'],
                            ),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                  Container(
                    width: Get.width,
                    height: Get.height,
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 60),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              const Color(0xFF131B20).withOpacity(0),
                              const Color(0xFF3D4754).withOpacity(0.7)
                            ],
                            begin: Alignment.center,
                            end: Alignment.bottomCenter
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          controller.onBoardingList[index]['title'],
                          style: const TextStyle(
                              color: AppColors.lightColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 12,),
                        Text(
                          controller.onBoardingList[index]['subtitle'],
                          style: const TextStyle(
                              color: AppColors.lightColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 14
                          ),
                        ),
                        const SizedBox(height: 17,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            controller.currentIndex.value == 0
                                ? Container(
                              width: 31,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(5)))
                                : Container(
                              width: 5,
                              height: 5,
                              decoration: const BoxDecoration(
                                color: AppColors.lightColor,
                                shape: BoxShape.circle
                              ),
                            ),
                            const SizedBox(width: 5,),
                            controller.currentIndex.value != 0
                                ? Container(
                                width: 31,
                                height: 5,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(5)))
                                : Container(
                              width: 5,
                              height: 5,
                              decoration: const BoxDecoration(
                                  color: AppColors.lightColor,
                                  shape: BoxShape.circle
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24,),
                        SizedBox(
                          width: Get.width,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                )
                            ),
                            onPressed: () {
                              controller.currentIndex.value == 0
                                  ? controller.carouselController.nextPage()
                                  : Get.offAndToNamed(PageNames.AUTH_GATE);
                            },
                            child: Center(
                                child: Text(
                                  controller.onBoardingList[index]['button_text'],
                                  style: const TextStyle(
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

                ],
              );
            },
            options: CarouselOptions(
              height: Get.height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                controller.currentIndex.value = index;
                controller.update();
              }
              // autoPlay: false,
            ),
          )
        );
      },
    );
  }
}
