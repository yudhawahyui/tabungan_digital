import 'package:get/get.dart';

import '../modules/detail_tabungan_page/bindings/detail_tabungan_page_binding.dart';
import '../modules/detail_tabungan_page/views/detail_tabungan_page_view.dart';
import '../modules/home_page/bindings/home_page_binding.dart';
import '../modules/home_page/views/home_page_view.dart';
import '../modules/login_page/bindings/login_page_binding.dart';
import '../modules/login_page/views/login_page_view.dart';
import '../modules/register_page/register_page_1/bindings/register_page_binding.dart';
import '../modules/register_page/register_page_1/views/register_page_view.dart';
import '../modules/register_page/register_page_2/bindings/register_page_2_binding.dart';
import '../modules/register_page/register_page_2/bindings/register_page_2_binding.dart';
import '../modules/register_page/register_page_2/views/register_page_2_view.dart';
import '../modules/register_page/register_page_2/views/register_page_2_view.dart';
import '../modules/register_page/register_page_2/views/register_page_2_view.dart';
import '../modules/tambah_tabungan_page/bindings/tambah_tabungan_page_binding.dart';
import '../modules/tambah_tabungan_page/views/tambah_tabungan_page_view.dart';
import '../modules/tercapai_page/bindings/tercapai_page_binding.dart';
import '../modules/tercapai_page/views/tercapai_page_view.dart';
import '../modules/wellcome_page/wellcome_page_1/bindings/wellcome_page_binding.dart';
import '../modules/wellcome_page/wellcome_page_1/views/wellcome_page_view.dart';
import '../modules/wellcome_page/wellcome_page_2/bindings/wellcome_page_2_binding.dart';
import '../modules/wellcome_page/wellcome_page_2/views/wellcome_page_2_view.dart';
import '../modules/wellcome_page/wellcome_page_3/bindings/wellcome_page_3_binding.dart';
import '../modules/wellcome_page/wellcome_page_3/views/wellcome_page_3_view.dart';
import '../modules/wellcome_page/wellcome_page_4/bindings/wellcome_page_4_binding.dart';
import '../modules/wellcome_page/wellcome_page_4/views/wellcome_page_4_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELLCOME_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.WELLCOME_PAGE,
      page: () => const WellcomePageView(),
      binding: WellcomePageBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => const LoginPageView(),
      binding: LoginPageBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: _Paths.REGISTER_PAGE,
      page: () => const RegisterPageView(),
      binding: RegisterPageBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: _Paths.TERCAPAI_PAGE,
      page: () => const TercapaiPageView(),
      binding: TercapaiPageBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: _Paths.TAMBAH_TABUNGAN_PAGE,
      page: () => const TambahTabunganPageView(),
      binding: TambahTabunganPageBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => const HomePageView(),
      binding: HomePageBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: _Paths.DETAIL_TABUNGAN_PAGE,
      page: () => const DetailTabunganPageView(),
      binding: DetailTabunganPageBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: _Paths.WELLCOME_PAGE_2,
      page: () => const WellcomePage2View(),
      binding: WellcomePage2Binding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: _Paths.WELLCOME_PAGE_3,
      page: () => const WellcomePage3View(),
      binding: WellcomePage3Binding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: _Paths.WELLCOME_PAGE_4,
      page: () => const WellcomePage4View(),
      binding: WellcomePage4Binding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: _Paths.REGISTER_PAGE_2,
      page: () => const RegisterPage2View(),
      binding: RegisterPage2Binding(),
      children: [
        GetPage(
          name: _Paths.REGISTER_PAGE_2,
          page: () => const RegisterPage2View(),
          binding: RegisterPage2Binding(),
        ),
      ],
    ),
  ];
}