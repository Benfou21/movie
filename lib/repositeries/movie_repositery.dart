import 'package:flutter/cupertino.dart';
import 'package:movie/exceptions/movies_exceptions.dart';
import 'package:movie/repositeries/env_repositery.dart';
import 'package:dio/dio.dart';
import 'package:movie/model/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_methods.dart';

import 'package:movie/repositeries/providers.dart';

import 'auth_methods.dart';

class TheMovieNotifier extends StateNotifier<Movie> {
  TheMovieNotifier()
      : super(Movie(title: 'null', posterPath: 'null', popularity: 0));

  FindMovie(String title, List<Movie> movies) {
    for (var movie in movies) {
      if (movie.title == title) {
        state = movie;
      }
    }
  }
}

class MoviesNotifier extends StateNotifier<List<Movie>> {
  MoviesNotifier() : super([]);
}

class FavsNotifier extends StateNotifier<List<Movie>> {
  FavsNotifier(this.read, [List<Movie>? state]) : super([]);

  final Reader read;

  void add(Movie movie) async {
    state = [...state, movie];
    movie.isFav = !movie.isFav;
    await AuthMethods().saveFav(fav: state);

    //read(moviesProvider.notifier).toggleFav(id: movie.id);
  }

  void remove(Movie movie) async {
    state = state.where((element) => element.id != movie.id).toList();
    movie.isFav = !movie.isFav;
    await AuthMethods().saveFav(fav: state);
  }
}

class MovieRepositery {
  MovieRepositery(this._environmentConfig, this._dio);

  final EnvironmentConfig _environmentConfig;
  final Dio _dio;

  Future<List<Movie>> getMovies() async {
    try {
      final response = await _dio.get(
        "https://api.themoviedb.org/3/movie/popular?api_key=${_environmentConfig.movieApiKey}&language=en-US&page=1",
      );

      final results = List<Map<String, dynamic>>.from(response.data['results']);

      List<Movie> movies = results
          .map((movieData) => Movie.fromMap(movieData))
          .toList(growable: false);
      return movies;
    } on DioError catch (e) {
      throw MoviesException.fromDioError(e);
    }
  }

  Future<List<Movie>> getMoreMovies() async {
    try {
      List<Map<String, dynamic>> results = [];

      for (int i = 1; i < 5; i++) {
        final response = await _dio.get(
          "https://api.themoviedb.org/3/movie/popular?api_key=${_environmentConfig.movieApiKey}&language=en-US&page=${i}",
        );

        results
            .addAll(List<Map<String, dynamic>>.from(response.data['results']));
      }

      List<Movie> movies = results
          .map((movieData) => Movie.fromMap(movieData))
          .toList(growable: false);
      return movies;
    } on DioError catch (e) {
      throw MoviesException.fromDioError(e);
    }
  }
}
