import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furtable/features/order/not_yet_paid/payment_success/payment_success_controller.dart';
import 'package:furtable/routes/page_names.dart';
import 'package:furtable/utils/helper/currency_format.dart';
import 'package:get/get.dart';
import '../../../../theme.dart';

class PaymentSuccessPage extends StatefulWidget {
  const PaymentSuccessPage({super.key});

  @override
  State<PaymentSuccessPage> createState() => _PaymentSuccessPageState();
}

class _PaymentSuccessPageState extends State<PaymentSuccessPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  int time = 86400;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(
          seconds: time
        )
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentSuccessController>(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.secondaryColor
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Selesaikan pembayaran sebelum batas waktu agar pesananmu tidak EXPIRED.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: AppColors.darkColor
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Countdown(
                            key: const Key(''),
                            animation: StepTween(
                              begin: time, // THIS IS A USER ENTERED NUMBER
                              end: 0,
                            ).animate(_animationController),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Text(
                      '${Get.arguments['bank_name']} Virtual Account',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkColor
                      ),
                    ),
                    const SizedBox(height: 12,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nomor Virtual Account',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.greyColor
                                ),
                              ),
                              SizedBox(height: 8,),
                              Text(
                                '2005200226012002',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.darkColor
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Clipboard.setData(
                                  const ClipboardData(text: '2005200226012002')
                              );
                              Fluttertoast.showToast(
                                  msg: 'Nomor VA berhasil disalin!',
                                  backgroundColor: AppColors.primaryColor
                              );
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/icon_copy.svg',
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(width: 6,),
                                const Text(
                                  'Salin',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.primaryColor
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 12,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total Bayar',
                            style: TextStyle(
                              color: AppColors.greyColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 12
                            ),
                          ),
                          const SizedBox(height: 8,),
                          Text(
                            CurrencyFormat.convertToIdr(
                              Get.arguments['total_price']
                            ),
                            style: const TextStyle(
                              color: AppColors.darkColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    RichText(
                      text: const TextSpan(
                        text: 'Pastikan* ',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                          color: AppColors.greyColor
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'total bayar ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: AppColors.primaryColor
                            ),
                          ),
                          TextSpan(
                            text: 'aplikasi dengan yang akan dibayarkan adalah sama!',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 10,
                                color: AppColors.greyColor
                            ),
                          ),
                        ]
                      ),
                    ),
                    const SizedBox(height: 30,),
                    SizedBox(
                      width: Get.width,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColors.primaryColor,
                          backgroundColor: AppColors.lightColor,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: AppColors.greyColor
                              ),
                              borderRadius: BorderRadius.circular(14),
                            )
                        ),
                        onPressed: () {
                          Get.offAllNamed(PageNames.BOTTOM_NAVIGATION_BAR);
                        },
                        child: const Center(
                            child: Text(
                              'Kembali ke Beranda',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.greyColor
                              ),
                            )
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const Text(
                      '*Pembayaranmu akan kami verfikasi, dan pesananmu telah kami teruskan ke penjual.',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: AppColors.primaryColor
                      ),
                    ),
                  ],
                )
              )
            ],
          ),
        );
      },
    );
  }
}

class Countdown extends AnimatedWidget {
  const Countdown({required Key key, required this.animation})
      : super(key: key, listenable: animation);
  final Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);
    String second = '${clockTimer.inSeconds.remainder(60)}'.padLeft(2, '0');
    String minute = '${clockTimer.inMinutes.remainder(60)}';
    String hour = '${clockTimer.inHours.remainder(24)}';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              hour,
              style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(width: 11,),
            const Text(
              'Jam',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.normal
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              minute,
              style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(width: 11,),
            const Text(
              'Menit',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.normal
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              second,
              style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(width: 11,),
            const Text(
              'Detik',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.normal
              ),
            ),
          ],
        ),
      ],
    );
  }
}
