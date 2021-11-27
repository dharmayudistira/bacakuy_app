import 'package:get/get.dart';

import 'package:bacakuy_app/app/modules/articles/bindings/articles_binding.dart';
import 'package:bacakuy_app/app/modules/articles/views/articles_view.dart';
import 'package:bacakuy_app/app/modules/home/bindings/home_binding.dart';
import 'package:bacakuy_app/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

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
  ];
}
