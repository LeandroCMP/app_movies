// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class MovieModel {
  final int id;
  final String title;
  final String date;
  final String image;
  final List<int> genres;
  final bool favorite;
  MovieModel({
    required this.id,
    required this.title,
    required this.date,
    required this.image,
    required this.genres,
    required this.favorite,
  });

  MovieModel copyWith({
    int? id,
    String? title,
    String? date,
    String? image,
    List<int>? genres,
    bool? favorite,
  }) {
    return MovieModel(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      image: image ?? this.image,
      genres: genres ?? this.genres,
      favorite: favorite ?? this.favorite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'tittle': title,
      'release_date': date,
      'poster_path': image,
      'genre_ids': genres,
      'favorite': favorite,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'] ?? "",
      title: map['title'] ?? "",
      date: map['release_date'] ?? "",
      image: '${map['poster_path']}',
      genres: List<int>.from((map['genre_ids'] ?? const [])),
      favorite: map['favorite'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MovieModel(id: $id, tittle: $title, date: $date, image: $image, genres: $genres, favorite: $favorite)';
  }

  @override
  bool operator ==(covariant MovieModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.date == date &&
        other.image == image &&
        listEquals(other.genres, genres) &&
        other.favorite == favorite;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        date.hashCode ^
        image.hashCode ^
        genres.hashCode ^
        favorite.hashCode;
  }
}
