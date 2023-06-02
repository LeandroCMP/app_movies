// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:get/get.dart';

import 'package:app_movies/application/ui/loader/loader_mixin.dart';
import 'package:app_movies/application/ui/messages/messages_mixin.dart';
import 'package:app_movies/services/login/login_service.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final LoginService _loginService;
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  LoginController({required LoginService loginService})
      : _loginService = loginService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  Future<void> login() async {
    try {
      loading(true);
      await _loginService.login();
      loading(false);
      message(
        MessageModel.info(
            title: "Sucesso!", message: "Login realizado com sucesso!"),
      );
    } on Exception catch (e, s) {
      log(e.toString());
      log(s.toString());
      loading(false);
      message(
        MessageModel.error(title: "Erro!", message: "Erro ao realizar login!"),
      );
    }
  }
}
