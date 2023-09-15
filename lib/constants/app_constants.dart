import 'package:flutter/material.dart';

TextStyle titleTextStyle = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w900,
  color: Colors.black,
);

TextStyle subTitleTextStyle = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

TextStyle buttonTextStyle = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.blue,
);

Widget height(double height) {
  return SizedBox(
    height: height,
  );
}

Widget width(double width) {
  return SizedBox(
    width: width,
  );
}
