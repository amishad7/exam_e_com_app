import 'package:exam_e_com_app/views/Cart.dart';
import 'package:exam_e_com_app/views/Home.dart';
import 'package:exam_e_com_app/views/Preview.dart';
import 'package:exam_e_com_app/views/info_.dart';
import 'package:exam_e_com_app/views/splsh_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        "/": (context) => const Intro_(),
        "one": (context) => const Home_(),
        "two": (context) => const DetailPage(),
        "three": (context) => const Cart_(),
        "pdf": (context) => const PDF(),
      },
    ),
  );
}
