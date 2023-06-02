import 'package:app_movies/application/bindings/application_bindings.dart';
import 'package:app_movies/application/ui/movies_app_ui_config.dart';
import 'package:app_movies/modules/home/home_module.dart';
import 'package:app_movies/modules/login/login_module.dart';
import 'package:app_movies/modules/movies_detail/movie_detail_module.dart';
import 'package:app_movies/modules/splashscreen/splash_module.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  RemoteConfig.instance.fetchAndActivate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: MoviesAppUiConfig.tittle,
      debugShowCheckedModeBanner: false,
      theme: MoviesAppUiConfig.theme,
      initialBinding: ApplicationBindings(),
      getPages: [
        ...SplashModule().routers,
        ...LoginModule().routers,
        ...HomeModule().routers,
        ...MovieDetailModule().routers,
      ],
    );
  }
}
