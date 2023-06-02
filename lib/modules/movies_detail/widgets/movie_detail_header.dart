import 'package:app_movies/models/movie_detail_model.dart';
import 'package:app_movies/modules/movies_detail/movies_detail_controller.dart';
import 'package:flutter/material.dart';

class MovieDetailHeader extends StatelessWidget {
  final MovieDetailModel? movie;
  const MovieDetailHeader({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var movieData = movie;
    if (movieData != null) {
      return SizedBox(
        height: 278,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: movie!.urlImages.length,
          itemBuilder: (context, index) {
            final image = movieData.urlImages[index];
            return Padding(
              padding: const EdgeInsets.all(2),
              child: Image.network(image),
            );
          },
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
