import 'package:get/get.dart';
import './movies_detail_controller.dart';

class MoviesDetailBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(MoviesDetailController(moviesService: Get.find()));
  }
}
