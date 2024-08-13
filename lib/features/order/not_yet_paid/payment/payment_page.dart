import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:furtable/features/order/not_yet_paid/payment/payment_controller.dart';
import 'package:furtable/utils/helper/currency_format.dart';
import 'package:get/get.dart';
import '../../../../routes/page_names.dart';
import '../../../../theme.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<PaymentController>(
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
                        'Bayar',
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
                    Row(
                      children: [
                        SizedBox(
                          width: Get.width * 0.5,
                          child: Row(
                            children: [
                              Text(
                                Get.arguments == null
                                    ? 'Permintaan/Request'
                                    : controller.fromHome.value ? Get.arguments['furniture_name']
                                    : controller.listFurniture[0].name ,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.secondaryGreyColor
                                ),
                              ),
                              const Spacer(),
                              const Text(
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
                          CurrencyFormat.convertToIdr(
                            Get.arguments['from_home']
                                ? Get.arguments['initial_price']
                                : controller.listFurniture[0].price
                          ),
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor
                          ),
                        )
                      ],
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
                        const Text(
                          '204 cm',
                          style: TextStyle(
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
                        const Text(
                          '89 cm',
                          style: TextStyle(
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
                        const Text(
                          '12 cm',
                          style: TextStyle(
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
                        const Text(
                          '76 cm',
                          style: TextStyle(
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
                        const Text(
                          '78 cm',
                          style: TextStyle(
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
                        const Text(
                          '64 cm',
                          style: TextStyle(
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
                        const Text(
                          '44 cm',
                          style: TextStyle(
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
                        const Text(
                          'Bahan Velvet',
                          style: TextStyle(
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
                        const Text(
                          'Jati Tua',
                          style: TextStyle(
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
                    Visibility(
                      visible: Get.arguments != null ? true : false,
                      child: TextField(
                        cursorColor: AppColors.primaryColor,
                        maxLines: 5,
                        style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.normal
                        ),
                        readOnly: Get.arguments['from_home']
                            ? true
                            : false,
                        onChanged: (String? value) {
                          controller.alamatPengiriman = value;
                        },
                        decoration: InputDecoration(
                            hintText: Get.arguments['from_home']
                                ? Get.arguments['alamat_pengiriman']
                                : 'Alamat Pengiriman',
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
                    ),
                    Visibility(
                      visible: Get.arguments != null ? false : true,
                      child: const Flexible(
                        child: Text(
                          'Dusun manggissari RT 03/06 Karangtawang, Nusawungu, Cilacap, Jawa Tengah 53283',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: AppColors.secondaryGreyColor
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const Text(
                      'Jasa Pengiriman',
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
                                'Biaya Pengiriman',
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
                          CurrencyFormat.convertToIdr(controller.shippingCost),
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                    const Text(
                      'Metode Pembayaran',
                      style: TextStyle(
                          color: AppColors.darkColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    const SizedBox(height: 12,),
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.lightGreyColor
                        )
                      ),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              controller.index.value = index;
                            },
                            child: Obx(() =>  Container(
                              width: Get.width,
                              height: 50,
                              margin: EdgeInsets.only(bottom: index != 2 ? 9 : 0),
                              padding: const EdgeInsets.only(left: 16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: AppColors.lightGreyColor
                                  )
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: controller.index.value == index
                                                  ? AppColors.primaryColor
                                                  : AppColors.lightGreyColor
                                          )
                                      ),
                                      child: Center(
                                        child: Container(
                                          width: 14,
                                          height: 14,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: controller.index.value == index
                                                  ? AppColors.primaryColor
                                                  : AppColors.lightColor
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 19,),
                                    Container(
                                      width: 66,
                                      height: 27,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  controller.bankList[index].imagePath
                                              ),
                                              fit: BoxFit.cover
                                          )
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),)
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 41,),
                    Row(
                      children: [
                        const Text(
                          'Total Harga',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkColor
                          ),
                        ),
                        const Spacer(),
                        Text(
                          CurrencyFormat.convertToIdr((
                          Get.arguments['from_home']
                              ? Get.arguments['initial_price']
                              : controller.listFurniture[0].price
                          ) + controller.shippingCost),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
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
              onPressed: () async {
                if(!Get.arguments['from_home']) {
                  await controller.firestore
                      .collection('users').doc(controller.user?.uid).update({
                    'order' : true
                  });
                  await controller.firestore.collection('users')
                      .doc(controller.user?.uid).set({
                    'product' : [
                      {
                        'name' : controller.listFurniture[0].name,
                        'initial_price' : controller.listFurniture[0].price,
                        'total_price' : controller.listFurniture[0].price + controller.shippingCost,
                        'alamat_pengiriman' : controller.alamatPengiriman?? '',
                        'panjang' : '204 cm',
                        'lebar' : '89 cm',
                        'lebar_sandaran_tangan' : '12 cm',
                        'lebar_dudukan' : '76 cm',
                        'tinggi_sofa' : '78 cm',
                        'tinggi_sandaran_tangan' : '64 cm',
                        'tinggi_dudukan' : '44 cm',
                        'bahan_kain' : 'Bahan Velvet',
                        'bahan_furniture' : 'Jati Tua'
                      }
                    ],
                  }, SetOptions(merge: true));
                }
                Get.toNamed(
                    PageNames.PAYMENT_SUCCESS,
                    arguments: {
                      'total_price' : Get.arguments['from_home']
                          ? Get.arguments['initial_price'] + controller.shippingCost
                          : controller.listFurniture[0].price + controller.shippingCost,
                      'bank_name' : controller.bankList[controller.index.value].name
                    }
                );
              },
              child: const Center(
                  child: Text(
                    'Bayar Sekarang',
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
