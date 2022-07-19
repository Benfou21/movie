import 'constants.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: TextField(
              style: const TextStyle(color: Colors.black),
              decoration: kTextFieldDecoration.copyWith(
                  hintText: "Entrer votre mot de passe"),
            )),
        const Icon(
          Icons.search,
          size: 40,
        ),
      ],
    );
  }
}
