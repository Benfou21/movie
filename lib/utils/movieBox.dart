import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:movie/model/movie.dart';

import 'package:movie/repositeries/providers.dart';
import 'package:movie/repositeries/auth_methods.dart';

class MovieBox extends StatelessWidget {
  const MovieBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final movie = ref.watch(currentMovie);
        final listFavs = ref.watch(favsProvider);

        return Stack(
          children: [
            Image.network(
              movie.posterPath == 'null'
                  ? 'https://storage.googleapis.com/twg-content/images/MarketingResources_Thumbnail_Search.width-1200.jpg'
                  : movie.fullImageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _FrontBanner(
                text: movie.title == 'null' ? "" : movie.title,
                note: movie.popularity,
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                return Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      onPressed: () async {
                        if (movie.isFav == true) {
                          ref.read(favsProvider.notifier).remove(movie);
                        } else {
                          ref.read(favsProvider.notifier).add(movie);
                        }
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: movie.isFav == true
                            ? const Color.fromARGB(255, 201, 31, 31)
                            : const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ));
              },
            )
          ],
        );
      },
    );
  }
}

class _FrontBanner extends StatelessWidget {
  const _FrontBanner({Key? key, required this.text, required this.note})
      : super(key: key);

  final String text;
  final double note;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          color: Colors.grey.shade200.withOpacity(0.5),
          height: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text("Grade : ${note}/10"),
            ],
          ),
        ),
      ),
    );
  }
}
