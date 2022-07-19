import 'package:flutter/material.dart';

const kMain_color = Color.fromARGB(255, 75, 160, 202);

const kMain2_color = Color.fromARGB(255, 40, 171, 236);

const kMain3_color = Color.fromARGB(255, 10, 119, 161);

const kZone_color = Color.fromARGB(59, 76, 175, 79);

const kOrange_main = Color(0xfffea581);

const kOrange_main2 = Color(0xfffe7d5b);

const kOrange_main3 = Color.fromARGB(255, 255, 238, 223);

const kOrange_main4 = Color.fromARGB(85, 254, 164, 129);

const kHeadline1 = TextStyle(
  fontSize: 27,
  color: Colors.white,
);

const kHeadline2 = TextStyle(
  fontSize: 18,
  color: Colors.white,
);

const kHeadline = TextStyle(
  fontSize: 30,
  color: Colors.black,
);

const kHeadline5 = TextStyle(
  fontSize: 25,
  color: Colors.black,
);

const kHeadline2bis = TextStyle(
  fontSize: 18,
  color: kMain_color,
);

const kHeadline3 = TextStyle(
  fontSize: 15,
  color: Colors.black,
  decoration: TextDecoration.underline,
);

const kPagetitle = TextStyle(fontSize: 20, color: Colors.white);

const kTextSpec = TextStyle(
  fontSize: 12,
  color: Colors.black,
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
        BorderSide(color: Color.fromARGB(255, 189, 222, 228), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
