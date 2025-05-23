import 'package:flutter/material.dart';

Widget customIcons({required IconData iconData, Color? color}) {
  return Icon(
    iconData,
    fill: 1,
    weight: 500,
    size: 40,
    color: color ?? Colors.blue.shade900,
  );
}
