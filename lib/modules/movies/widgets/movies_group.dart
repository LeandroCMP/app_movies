import 'package:app_movies/application/ui/widgets/movie_card.dart';
import 'package:app_movies/models/movie_model.dart';
import 'package:app_movies/modules/movies/movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MoviesGroup extends GetView<MoviesController> {
  final String tittle;
  final List<MovieModel> movies;
  const MoviesGroup({Key? key, required this.tittle, required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            tittle,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
              height: 280,
              child: Obx(() {
                return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      var movie = movies[index];
                      return MovieCard(
                        movie: movie,
                        favoriteCallback: () => controller.favoriteMovie(movie),
                      );
                    });
              })),
        ],
      ),
    );
  }
}
