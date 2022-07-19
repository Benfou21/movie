import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

var _uuid = Uuid();

class Movie {
  Movie(
      {required this.title,
      required this.posterPath,
      required this.popularity,
      this.isFav = false,
      String? id})
      : this.id = id ?? _uuid.v4();

  final String title;
  final String posterPath;
  final double popularity;
  final String id;
  bool isFav;

  String get fullImageUrl => 'https://image.tmdb.org/t/p/w200$posterPath';

  Map<dynamic, dynamic> toMap() {
    return {
      'title': title,
      'poster_path': posterPath,
      'vote_average': popularity,
    };
  }

  // from json to movie
  factory Movie.fromMap(Map<dynamic, dynamic> map) {
    if (map == null) {
      return Movie(title: "null", posterPath: "null", popularity: 0);
    } else {
      return Movie(
          posterPath: map['poster_path'],
          title: map['title'],
          popularity: map['vote_average'].toDouble());
    }
  }

  // from movie to json
  String toJson() => json.encode(toMap());
}
