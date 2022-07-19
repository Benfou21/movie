import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/repositeries/providers.dart';
import 'package:movie/utils/favBox.dart';
import 'package:movie/utils/widegt/constants.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/search_page');
            },
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text("Favourites Movies"),
        centerTitle: true,
        backgroundColor: kOrange_main,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          return ListView(
            children: [
              ...ref
                  .watch(favsProvider)
                  .map(
                    (movie) => ProviderScope(
                      overrides: [currentMovie.overrideWithValue(movie)],
                      child: const favBow(),
                    ),
                  )
                  .toList()
            ],
          );
        },
      ),
    );
  }
}
