
import 'package:flutter/material.dart';

Widget tab(BuildContext context, String category) {
  return Container(
    height: 30,
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(horizontal: 15),
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: Text(
      category,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );
}
