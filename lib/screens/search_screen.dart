import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/utils/movieBox.dart';
import 'package:gradient_textfield/gradient_textfield.dart';
import 'package:movie/repositeries/providers.dart';
import 'package:movie/utils/widegt/constants.dart';

class SearchScreen extends ConsumerWidget {
  SearchScreen({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theMovie = ref.watch(ThemovieProvider);
    final moviesStorage = ref.watch(moviesProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie search"),
        centerTitle: true,
        backgroundColor: kOrange_main,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProviderScope(
                  overrides: [currentMovie.overrideWithValue(theMovie)],
                  child: MovieBox(),
                ),
              ),
              Gradienttextfield(
                controller: controller,
                radius: 40,
                height: 60,
                width: 400,
                colors: const [kOrange_main, Colors.white],
                text: "Movie title",
                fontColor: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
              TextButton(
                onPressed: () {
                  ref
                      .read(ThemovieProvider.notifier)
                      .FindMovie(controller.text, moviesStorage.state);
                  print(controller.text);
                  controller.clear();
                },
                child: Text("Search"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



/*
Scaffold(
      appBar: AppBar(
        title: const Text("Movie search"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: ref.watch(movieFututProvider).when(
          data: (movies) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MovieBox(movie: theMovie.state),
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(icon: Icon(Icons.search)),
                  onSubmitted: (val) {
                    theMovie.state = FindMovie(val, movies);
                  },
                )
              ],
            );
          },
          error: (e, st) {
            return Text("error");
          },
          loading: () => const Center(child: CircularProgressIndicator())),
    );
*/