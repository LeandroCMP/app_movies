import 'package:app_movies/application/ui/theme_extensions.dart';
import 'package:app_movies/models/genre_model.dart';
import 'package:flutter/material.dart';

class FilterTag extends StatelessWidget {
  final GenreModel genre;
  final bool selected;
  final VoidCallback onPressed;
  const FilterTag({
    Key? key,
    required this.genre,
    required this.selected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        constraints: const BoxConstraints(minWidth: 100, minHeight: 30),
        decoration: BoxDecoration(
          color: selected ? context.themeRed : Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            genre.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
