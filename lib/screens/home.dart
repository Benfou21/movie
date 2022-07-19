import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/exceptions/movies_exceptions.dart';

import 'package:movie/utils/movieBox.dart';

import 'package:movie/repositeries/providers.dart';

import 'package:movie/utils/errorBody.dart';
import 'package:movie/utils/widegt/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/fav_screen');
              },
              icon: const Icon(Icons.favorite),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/search_page');
              },
              icon: const Icon(Icons.search),
            ),
          ],
          title: const Text("Movie list"),
          centerTitle: true,
          backgroundColor: kOrange_main,
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final moviesStorage = ref.watch(moviesProvider.notifier);

            return ref.watch(movieFututProvider).when(
                data: (movies) {
                  moviesStorage.state = movies;

                  return RefreshIndicator(
                    onRefresh: () async {
                      return ref.refresh(movieFututProvider);
                    },
                    child: GridView.extent(
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.7,
                      children: movies
                          .map((movie) => ProviderScope(overrides: [
                                currentMovie.overrideWithValue(movie)
                              ], child: MovieBox()))
                          .toList(),
                    ),
                  );
                },
                error: (e, st) {
                  if (e is MoviesException) {
                    return ErrorBody(message: e.message!);
                  }
                  return const ErrorBody(message: "error");
                },
                loading: () =>
                    const Center(child: CircularProgressIndicator()));
          },
        ));
  }
}
