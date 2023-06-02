import 'package:app_movies/modules/movies/movies_controller.dart';
import 'package:app_movies/modules/movies/widgets/filter_tag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesFilters extends GetView<MoviesController> {
  const MoviesFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Obx(() {
            return Row(
              children: controller.genres
                  .map((g) => FilterTag(
                        genre: g,
                        onPressed: () => controller.filterByGenre(g),
                        selected: controller.genreSelected.value?.id == g.id,
                      ))
                  .toList(),
            );
          })),
    );
  }
}
