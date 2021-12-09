import 'package:get/get.dart';

import 'package:bacakuy_app/app/modules/add_literacy/bindings/add_literacy_binding.dart';
import 'package:bacakuy_app/app/modules/add_literacy/views/add_literacy_view.dart';
import 'package:bacakuy_app/app/modules/articles/bindings/articles_binding.dart';
import 'package:bacakuy_app/app/modules/articles/views/articles_view.dart';
import 'package:bacakuy_app/app/modules/home/bindings/home_binding.dart';
import 'package:bacakuy_app/app/modules/home/views/home_view.dart';
import 'package:bacakuy_app/app/modules/login/bindings/login_binding.dart';
import 'package:bacakuy_app/app/modules/login/views/login_view.dart';
import 'package:bacakuy_app/app/modules/main/bindings/main_binding.dart';
import 'package:bacakuy_app/app/modules/main/views/main_view.dart';
import 'package:bacakuy_app/app/modules/setting/bindings/setting_binding.dart';
import 'package:bacakuy_app/app/modules/setting/views/setting_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLES,
      page: () => ArticlesView(),
      binding: ArticlesBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.ADD_LITERACY,
      page: () => AddLiteracyView(),
      binding: AddLiteracyBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
  ];
}
