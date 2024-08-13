import 'package:flutter/material.dart';
import 'package:furtable/features/request/detail_request/detail_request_controller.dart';
import 'package:get/get.dart';
import '../../../routes/page_names.dart';
import '../../../theme.dart';

class DetailRequestPage extends StatelessWidget {
  const DetailRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailRequestController>(
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
                      const Text(
                        'Detail Pesanan',
                        style: TextStyle(
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
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  children: [
                    const Text(
                      'Nama Barang',
                      style: TextStyle(
                          color: AppColors.darkColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    const SizedBox(height: 12,),
                    const Text(
                      'Permintaan/Request',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: AppColors.secondaryGreyColor
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const Text(
                      'Ukuran',
                      style: TextStyle(
                          color: AppColors.darkColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    const SizedBox(height: 12,),
                    Row(
                      children: [
                        SizedBox(
                          width: Get.width * 0.5,
                          child: const Row(
                            children: [
                              Text(
                                'Panjang',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.secondaryGreyColor
                                ),
                              ),
                              Spacer(),
                              Text(
                                ' : ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.secondaryGreyColor
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          '${Get.arguments['panjang']} cm',
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: AppColors.secondaryGreyColor
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(
                          width: Get.width * 0.5,
                          child: const Row(
                            children: [
                              Text(
                                'Lebar',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.secondaryGreyColor
                                ),
                              ),
                              Spacer(),
                              Text(
                                ' : ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.secondaryGreyColor
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          '${Get.arguments['lebar']} cm',
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: AppColors.secondaryGreyColor
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(
                          width: Get.width * 0.5,
                          child: const Row(
                            children: [
                              Text(
                                'Lebar Sandaran Tangan',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.secondaryGreyColor
                                ),
                              ),
                              Spacer(),
                              Text(
                                ' : ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.secondaryGreyColor
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          '${Get.arguments['lebar_sandaran_tangan']} cm',
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: AppColors.secondaryGreyColor
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(
                          width: Get.width * 0.5,
                          child: const Row(
                            children: [
                              Text(
                                'Lebar Dudukan',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.secondaryGreyColor
                                ),
                              ),
                              Spacer(),
                              Text(
                                ' : ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.secondaryGreyColor
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          '${Get.arguments['lebar_dudukan']} cm',
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: AppColors.secondaryGreyColor
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(
                          width: Get.width * 0.5,
                          child: const Row(
                            children: [
                              Text(
                                'Tinggi Sofa',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.secondaryGreyColor
                                ),
                              ),
                              Spacer(),
                              Text(
                                ' : ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.secondaryGreyColor
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          '${Get.arguments['tinggi_sofa']} cm',
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: AppColors.secondaryGreyColor
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(
                          width: Get.width * 0.5,
                          child: const Row(
                            children: [
                              Text(
                                'Tinggi Sandaran Tangan',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.secondaryGreyColor
                                ),
                              ),
                              Spacer(),
                              Text(
                                ' : ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.secondaryGreyColor
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          '${Get.arguments['tinggi_sandaran_tangan']} cm',
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: AppColors.secondaryGreyColor
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(
                          width: Get.width * 0.5,
                          child: const Row(
                            children: [
                              Text(
                                'Tinggi Dudukan',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.secondaryGreyColor
                                ),
                              ),
                              Spacer(),
                              Text(
                                ' : ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.secondaryGreyColor
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          '${Get.arguments['tinggi_dudukan']} cm',
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: AppColors.secondaryGreyColor
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                    const Text(
                      'Bahan',
                      style: TextStyle(
                          color: AppColors.darkColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    const SizedBox(height: 12,),
                    Row(
                      children: [
                        SizedBox(
                          width: Get.width * 0.5,
                          child: const Row(
                            children: [
                              Text(
                                'Bahan Kain',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.secondaryGreyColor
                                ),
                              ),
                              Spacer(),
                              Text(
                                ' : ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.secondaryGreyColor
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          '${Get.arguments['bahan_kain']}',
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: AppColors.secondaryGreyColor
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(
                          width: Get.width * 0.5,
                          child: const Row(
                            children: [
                              Text(
                                'Bahan Furniture',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.secondaryGreyColor
                                ),
                              ),
                              Spacer(),
                              Text(
                                ' : ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.secondaryGreyColor
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          Get.arguments['bahan_furniture'],
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: AppColors.secondaryGreyColor
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                    const Text(
                      'Alamat Pengiriman',
                      style: TextStyle(
                          color: AppColors.darkColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    const SizedBox(height: 12,),
                    TextField(
                      cursorColor: AppColors.primaryColor,
                      maxLines: 5,
                      style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.normal
                      ),
                      decoration: InputDecoration(
                          hintText: 'Alamat Pengiriman',
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          hintStyle: const TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.normal
                          ),
                          fillColor: AppColors.secondaryColor,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          )
                      ),
                    ),
                    const SizedBox(height: 30,),
                    const Row(
                      children: [
                        Text(
                          '*Jika data pesanan sudah benar, Anda bisa klik ',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: AppColors.darkColor
                          ),
                        ),
                        Text(
                          'Buat Permintaan',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      'Dengan klik “Buat Permintaan”, berarti kamu setuju dengan Syarat dan Ketentuan Pengguna, serta Kebijakan Privasi kami.',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          color: AppColors.darkColor
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            color: AppColors.lightColor,
            surfaceTintColor: AppColors.lightColor,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  )
              ),
              onPressed: () {
                Get.toNamed(PageNames.DETAIL_REQUEST_SUCCESS);
              },
              child: const Center(
                  child: Text(
                    'Buat Permintaan',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.lightColor
                    ),
                  )
              ),
            ),
          ),
        );
      },
    );
  }
}
