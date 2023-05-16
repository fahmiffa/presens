import 'package:get/get.dart';

import '../modules/AddPresen/bindings/add_presen_binding.dart';
import '../modules/AddPresen/views/add_presen_view.dart';
import '../modules/MainMenu/bindings/main_menu_binding.dart';
import '../modules/MainMenu/views/main_menu_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/presen/bindings/presen_binding.dart';
import '../modules/presen/views/presen_view.dart';
import '../modules/scan/bindings/scan_binding.dart';
import '../modules/scan/views/scan_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_MENU,
      page: () => const MainMenuView(),
      binding: MainMenuBinding(),
    ),
    GetPage(
      name: _Paths.SCAN,
      page: () => ScanView(),
      binding: ScanBinding(),
    ),
    GetPage(
      name: _Paths.PRESEN,
      page: () => PresenView(),
      binding: PresenBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PRESEN,
      // page: () => const AddPresenView(),
      page: () => AddPresenView(),
      binding: AddPresenBinding(),
    ),
  ];
}
