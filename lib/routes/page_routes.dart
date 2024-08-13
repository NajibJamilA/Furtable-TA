import 'package:furtable/features/ar/ar_binding.dart';
import 'package:furtable/features/ar/ar_page.dart';
import 'package:furtable/features/auth_gate/auth_gate.dart';

import 'package:furtable/features/bottom_navigation_bar/bottom_navigation_bar_binding.dart';
import 'package:furtable/features/bottom_navigation_bar/bottom_navigation_bar_page.dart';
import 'package:furtable/features/detail_product/detail_product_binding.dart';
import 'package:furtable/features/detail_product/detail_product_page.dart';
import 'package:furtable/features/home/home_page.dart';
import 'package:furtable/features/login/login_binding.dart';
import 'package:furtable/features/login/login_page.dart';
import 'package:furtable/features/notification/notification_binding.dart';
import 'package:furtable/features/notification/notification_page.dart';
import 'package:furtable/features/on_boarding/on_boarding_binding.dart';
import 'package:furtable/features/on_boarding/on_boarding_page.dart';
import 'package:furtable/features/order/finished/finished_page.dart';
import 'package:furtable/features/order/not_yet_paid/not_yet_paid_page.dart';
import 'package:furtable/features/order/not_yet_paid/payment/payment_binding.dart';
import 'package:furtable/features/order/packed/packed_page.dart';
import 'package:furtable/features/order/sent/sent_page.dart';
import 'package:furtable/features/register/register_binding.dart';
import 'package:furtable/features/register/register_page.dart';
import 'package:furtable/features/request/detail_request/detail_request_binding.dart';
import 'package:furtable/features/request/detail_request/detail_request_page.dart';
import 'package:furtable/features/request/detail_request_success/detail_request_success_binding.dart';
import 'package:furtable/features/request/request_binding.dart';
import 'package:furtable/features/request/request_page.dart';
import 'package:furtable/features/search/search_page.dart';
import 'package:furtable/features/splash/splash_binding.dart';
import 'package:furtable/routes/page_names.dart';
import 'package:get/get.dart';
import '../features/category/category_binding.dart';
import '../features/category/category_page.dart';
import '../features/order/not_yet_paid/payment/payment_page.dart';
import '../features/order/not_yet_paid/payment_success/payment_success_binding.dart';
import '../features/order/not_yet_paid/payment_success/payment_success_page.dart';
import '../features/order/order_page.dart';
import '../features/profile/profile_page.dart';
import '../features/request/detail_request_success/detail_request_success_page.dart';
import '../features/search/search_binding.dart';
import '../features/splash/splash_page.dart';
import '../features/track/track_page.dart';

class PageRoutes {
  static final pages = [
    GetPage(
        name: PageNames.SPLASH,
        binding: SplashBinding(),
        page: () => const SplashPage()
    ),
    GetPage(
        name: PageNames.ON_BOARDING,
        binding: OnBoardingBinding(),
        page: () => const OnBoardingPage()
    ),
    GetPage(
        name: PageNames.AUTH_GATE,
        page: () => const AuthGate()
    ),
    GetPage(
        name: PageNames.LOGIN,
        binding: LoginBinding(),
        page: () => const LoginPage()
    ),
    GetPage(
        name: PageNames.REGISTER,
        binding: RegisterBinding(),
        page: () => const RegisterPage()
    ),
    GetPage(
      name: PageNames.BOTTOM_NAVIGATION_BAR,
      binding: BottomNavigationBarBinding(),
      page: () => const BottomNavigationBarPage(),
    ),
    GetPage(
      name: PageNames.HOME,
      page: () => const HomePage(),
    ),
    GetPage(
      name: PageNames.ORDER,
      page: () => const OrderPage(),
    ),
    GetPage(
      name: PageNames.TRACK,
      page: () => const TrackPage(),
    ),
    GetPage(
      name: PageNames.PROFILE,
      page: () => const ProfilePage(),
    ),
    GetPage(
      name: PageNames.NOT_YET_PAID,
      page: () => const NotYetPaidPage(),
    ),
    GetPage(
      name: PageNames.PACKED,
      page: () => const PackedPage(),
    ),
    GetPage(
      name: PageNames.SENT,
      page: () => const SentPage(),
    ),
    GetPage(
      name: PageNames.FINISHED,
      page: () => const FinishedPage(),
    ),
    GetPage(
      name: PageNames.DETAIL_PRODUCT,
      binding: DetailProductBinding(),
      page: () => const DetailProductPage(),
    ),
    GetPage(
      name: PageNames.AR,
      binding: ARBinding(),
      page: () => const ARPage()
    ),
    GetPage(
        name: PageNames.PAYMENT,
        binding: PaymentBinding(),
        page: () => const PaymentPage()
    ),
    GetPage(
        name: PageNames.CATEGORY,
        binding: CategoryBinding(),
        page: () => const CategoryPage()
    ),
    GetPage(
        name: PageNames.NOTIFICATION,
        binding: NotificationBinding(),
        page: () => const NotificationPage()
    ),
    GetPage(
        name: PageNames.REQUEST,
        binding: RequestBinding(),
        page: () => const RequestPage()
    ),
    GetPage(
        name: PageNames.DETAIL_REQUEST,
        binding: DetailRequestBinding(),
        page: () => const DetailRequestPage()
    ),
    GetPage(
        name: PageNames.DETAIL_REQUEST_SUCCESS,
        binding: DetailRequestSuccessBinding(),
        page: () => const DetailRequestSuccessPage()
    ),
    GetPage(
        name: PageNames.PAYMENT_SUCCESS,
        binding: PaymentSuccessBinding(),
        page: () => const PaymentSuccessPage()
    ),
    GetPage(
        name: PageNames.SEARCH,
        binding: SearchBinding(),
        page: () => const SearchPage()
    ),
  ];
}