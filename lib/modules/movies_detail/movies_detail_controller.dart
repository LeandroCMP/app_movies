import 'dart:developer';

import 'package:app_movies/application/ui/loader/loader_mixin.dart';
import 'package:app_movies/application/ui/messages/messages_mixin.dart';
import 'package:app_movies/models/movie_detail_model.dart';
import 'package:app_movies/services/movies/movies_service.dart';
import 'package:get/get.dart';

class MoviesDetailController extends GetxController
    with LoaderMixin, MessagesMixin {
  final MoviesService _moviesService;

  var loading = false.obs;
  var message = Rxn<MessageModel>();
  var movie = Rxn<MovieDetailModel>();

  MoviesDetailController({
    required MoviesService moviesService,
  }) : _moviesService = moviesService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final movieId = Get.arguments;
      loading(true);
      final movieDetailData = await _moviesService.getDetail(movieId);
      movie.value = movieDetailData;
      loading(false);
    } on Exception catch (e, s) {
      log(e.toString());
      log(s.toString());
      loading(false);
      message(
        MessageModel.error(
            title: 'Erro', message: 'Erro ao buscar detalhes do filme'),
      );
    }
  }
}
