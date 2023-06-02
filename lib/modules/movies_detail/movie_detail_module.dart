import 'package:app_movies/application/modules/module.dart';
import 'package:app_movies/modules/movies_detail/movies_detail_bindings.dart';
import 'package:app_movies/modules/movies_detail/movies_detail_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class MovieDetailModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/movie/detail',
      page: () => const MoviesDetailPage(),
      binding: MoviesDetailBindings(),
    ),
  ];
}
