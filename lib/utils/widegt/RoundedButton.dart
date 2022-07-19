import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie/utils/widegt/constants.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {required this.title,
      required this.colour,
      required this.onPressed,
      required this.coleurText});

  final Color colour;
  final Color coleurText;
  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(color: coleurText),
          ),
        ),
      ),
    );
  }
}

class RoundedButtonSpec extends StatelessWidget {
  RoundedButtonSpec({
    required this.colour,
    required this.onPressed,
    required this.icon,
  });

  final Color colour;

  final Function() onPressed;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: colour,
      borderRadius: BorderRadius.circular(30.0),
      elevation: 5.0,
      child: Column(
        children: [
          IconButton(
            icon: Icon(
              icon,
              color: Colors.grey[800],
              size: 20,
            ),
            onPressed: () => onPressed,
          ),
        ],
      ),
    );
  }
}
