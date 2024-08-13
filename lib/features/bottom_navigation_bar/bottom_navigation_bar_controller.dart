import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../theme.dart';

class BottomNavigationBarController extends GetxController {
  DateTime? currentBackPressTime;
  RxInt currentIndex = 0.obs;
  RxBool canPop = false.obs;
  int requiredSeconds = 2;

  void onPopInvoked(bool didPop) {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) >
            Duration(seconds: requiredSeconds)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
          msg: 'Tekan sekali lagi!',
          backgroundColor: AppColors.primaryColor
      );
      Future.delayed(
        Duration(seconds: requiredSeconds),
            () {
          canPop.value = false;
          Fluttertoast.cancel();
        },
      );
      canPop.value = true;
    }
  }
}