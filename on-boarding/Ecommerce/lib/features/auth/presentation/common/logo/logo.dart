import 'package:flutter/material.dart';

Widget logo() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
    child: const Text(
      'ECOM',
      style: TextStyle(
        color: Color.fromARGB(255, 54, 33, 243),
        fontWeight: FontWeight.bold,
        fontSize: 22.0
      ),
    ),
  );
}