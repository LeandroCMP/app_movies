// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:app_movies/application/auth/auth_service.dart';
import 'package:app_movies/application/ui/messages/messages_mixin.dart';
import 'package:app_movies/models/genre_model.dart';
import 'package:app_movies/models/movie_model.dart';
import 'package:app_movies/services/movies/movies_service.dart';
import 'package:get/get.dart';

import 'package:app_movies/services/genres/genres_service.dart';

class MoviesController extends GetxController with MessagesMixin {
  final GenresService _genresService;
  final MoviesService _moviesService;
  final AuthService _authService;

  final _message = Rxn<MessageModel>();
  final genres = <GenreModel>[].obs;
  final popularMovies = <MovieModel>[].obs;
  final topRated = <MovieModel>[].obs;

  var _popularMoviesOriginal = <MovieModel>[];
  var _topRatedMoviesOriginal = <MovieModel>[];

  final genreSelected = Rxn<GenreModel>();
  MoviesController({
    required AuthService authService,
    required GenresService genresService,
    required MoviesService moviesService,
  })  : _authService = authService,
        _genresService = genresService,
        _moviesService = moviesService;

  @override
  void onInit() {
    super.onInit();
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    getMovies();
  }

  Future<void> getMovies() async {
    try {
      final genresData = await _genresService.getGenres();
      genres.assignAll(genresData);

      final popularMoviesData = await _moviesService.getPopularMovies();
      _popularMoviesOriginal = popularMoviesData;
      final topRatedMoviesData = await _moviesService.getTopRated();
      _topRatedMoviesOriginal = topRatedMoviesData;
      popularMovies.assignAll(popularMoviesData);
      topRated.assignAll(topRatedMoviesData);
    } on Exception catch (e, s) {
      log(e.toString());
      log(s.toString());
      _message(
        MessageModel.error(
            title: "Erro", message: "Erro ao carregar dados da tela"),
      );
    }
  }

  void filterByName(String title) {
    if (title.isNotEmpty) {
      var newPopularMovies = _popularMoviesOriginal.where((movie) {
        return movie.title.toLowerCase().contains(title.toLowerCase());
      });

      var newTopRated = _topRatedMoviesOriginal.where((movie) {
        return movie.title.toLowerCase().contains(title.toLowerCase());
      });

      popularMovies.assignAll(newPopularMovies);
      topRated.assignAll(newTopRated);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRated.assignAll(_topRatedMoviesOriginal);
    }
  }

  void filterByGenre(GenreModel? genreModel) {
    var genreFilter = genreModel;
    if (genreFilter?.id == genreSelected.value?.id) {
      genreFilter = null;
    }
    genreSelected.value = genreFilter;

    if (genreFilter != null) {
      var newPopularMovies = _popularMoviesOriginal.where((movie) {
        return movie.genres.contains(genreFilter?.id);
      });
      var newTopRated = _popularMoviesOriginal.where((movie) {
        return movie.genres.contains(genreFilter?.id);
      });

      popularMovies.assignAll(newPopularMovies);
      topRated.assignAll(newTopRated);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRated.assignAll(_topRatedMoviesOriginal);
    }
  }

  Future<void> favoriteMovie(MovieModel movie) async {
    final user = _authService.user;
    if (user != null) {
      var newMovie = movie.copyWith(favorite: !movie.favorite);
      log(movie.favorite.toString());
      log(newMovie.favorite.toString());
      await _moviesService.addOrRemoveFavorite(user.uid, newMovie);
      await getMovies();
    }
  }
}
