import 'dart:ui';

import 'package:movie/repositeries/env_repositery.dart';
import 'package:dio/dio.dart';
import 'package:movie/model/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'user_repositery.dart';
import 'movie_repositery.dart';
import 'package:movie/model/user.dart';

final UserProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier();
});

final currentMovie = Provider<Movie>((ref) => throw UnimplementedError());

final ThemovieProvider = StateNotifierProvider<TheMovieNotifier, Movie>((ref) {
  return TheMovieNotifier();
});

final favsProvider = StateNotifierProvider<FavsNotifier, List<Movie>>((ref) {
  return FavsNotifier(ref.read);
});

final movieProvider = Provider<MovieRepositery>((ref) {
  final config = ref.read(environmentConfigProvider);

  return MovieRepositery(config, Dio());
});

final movieFututProvider = FutureProvider.autoDispose<List<Movie>>((ref) async {
  final movieRepos = ref.read(movieProvider);
  final movies = await movieRepos.getMoreMovies();

  return movies;
});

final moviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  return MoviesNotifier();
});
