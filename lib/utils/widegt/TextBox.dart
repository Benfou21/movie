import 'package:flutter/material.dart';
import 'package:movie/utils/widegt/constants.dart';

class TextBoxP extends StatelessWidget {
  final String text;

  const TextBoxP({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kMain2_color, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          text,
          style: kHeadline2,
        ),
      ),
    );
  }
}
