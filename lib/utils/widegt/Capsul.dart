import 'package:flutter/material.dart';
import 'constants.dart';
import 'RoundedButton.dart';
import 'package:google_fonts/google_fonts.dart';

class Capsul extends StatelessWidget {
  final String text;
  final Function() onpressed;

  const Capsul({Key? key, required this.text, required this.onpressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      onPressed: onpressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
        child: Text(
          text,
          style: GoogleFonts.roboto(textStyle: kPagetitle),
        ),
      ),
    );
  }
}
