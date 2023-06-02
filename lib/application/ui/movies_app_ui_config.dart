import 'package:flutter/material.dart';

class MoviesAppUiConfig {
  MoviesAppUiConfig._();

  static String get tittle => "Filmes APP";

  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Metropolis',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Color(0xFF222222),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}
