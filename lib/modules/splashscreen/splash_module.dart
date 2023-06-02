import 'package:app_movies/application/modules/module.dart';
import 'package:app_movies/modules/splashscreen/splash_bindings.dart';
import 'package:app_movies/modules/splashscreen/splash_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class SplashModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/',
      page: () => const SplashPage(),
      binding: SplashBindings(),
    ),
  ];
}
