import 'package:ar_flutter_plugin/datatypes/config_planedetection.dart';
import 'package:ar_flutter_plugin/widgets/ar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furtable/features/ar/ar_controller.dart';
import 'package:get/get.dart';
import '../../routes/page_names.dart';
import '../../theme.dart';

class ARPage extends StatelessWidget {
  const ARPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.lightColor.withOpacity(0.9),
        title: const Text(
          'Tampilan AR',
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
      body: GetBuilder<ARController>(
        builder: (controller) {
          return Stack(
            children: [
              ARView(
                onARViewCreated: controller.onARViewCreated,
                planeDetectionConfig: PlaneDetectionConfig.horizontal,
              ),
              Container(
                width: Get.width,
                height: 150,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.lightColor.withOpacity(0.8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      controller.listFurniture[0].name,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkColor
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text(
                      'Hangat dan ramah, rapi dan bergaya. Bantal kursi penyangga, sarung yang lembut serta keras seperti beton.',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: AppColors.greyColor,
                        fontSize: 14,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Lihat Deskripsi',
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
                            size: 14,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: controller.listFurniture[0].name != 'Suji Rak',
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 37,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.lightColor.withOpacity(0.8)
                    ),
                    child: ListView.separated(
                      itemCount: 3,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            controller.onRemoveEverything();
                            controller.currentIndex = index;
                            controller.update();
                          },
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                                color: controller.objectColors[index],
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: controller.currentIndex == index
                                        ? AppColors.blackColor
                                        : Colors.transparent,
                                    width: 2,
                                    strokeAlign: BorderSide.strokeAlignOutside
                                )
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: controller.listFurniture[0].name == 'Suji Rak',
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      controller.onRemoveEverything();
                    },
                    child: Container(
                      width: 37,
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.lightColor.withOpacity(0.8)
                      ),
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            color: const Color(0xFF292929),
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: AppColors.blackColor,
                                width: 2,
                                strokeAlign: BorderSide.strokeAlignOutside
                            )
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 152,
                  height: 50,
                  margin: const EdgeInsets.only(bottom: 34),
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
                            'furniture' : controller.listFurniture,
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
              ),
            ],
          );
        },
      ),
    );
  }
}