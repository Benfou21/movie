import 'package:flutter/material.dart';
import 'constants.dart';

class MainContainer extends StatelessWidget {
  MainContainer(
      {required this.text, required this.route, required this.snacktext});

  final String text;
  final String route;
  final String snacktext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        onDoubleTap: () {
          final snackBar = SnackBar(
            content: Text(snacktext),
            action: SnackBarAction(
              label: 'Ok',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Container(
          height: 170,
          decoration: BoxDecoration(
            color: kOrange_main3,
            border: Border.all(
              width: 2.0,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
              child: Text(
            text,
            style: kHeadline,
          )),
        ),
      ),
    );
  }
}
