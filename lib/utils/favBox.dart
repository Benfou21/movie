import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/repositeries/providers.dart';

class favBow extends StatelessWidget {
  const favBow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final movie = ref.watch(currentMovie);
      return ListTile(
        title: Text(movie.title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Method 3
                ref.read(favsProvider.notifier).remove(movie);
                //movie.isFav = !movie.isFav;
              },
            ),
          ],
        ),
      );
    });
  }
}
