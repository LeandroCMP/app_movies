import 'package:app_movies/modules/movies/movies_controller.dart';
import 'package:app_movies/modules/movies/widgets/movies_filters.dart';
import 'package:app_movies/modules/movies/widgets/movies_group.dart';
import 'package:app_movies/modules/movies/widgets/movies_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesPage extends GetView<MoviesController> {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        const MoviesHeader(),
        const MoviesFilters(),
        MoviesGroup(
          tittle: 'Mais Populares',
          movies: controller.popularMovies,
        ),
        MoviesGroup(
          tittle: 'Top Filmes',
          movies: controller.topRated,
        ),
      ],
    ));
  }
}
