import 'package:flutter/material.dart';

Widget headerText({required String text}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 10),
    child: Text(
      text,
      maxLines: 2,
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black),
    ),
  );
}
