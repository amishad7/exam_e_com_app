import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Intro_ extends StatefulWidget {
  const Intro_({super.key});

  @override
  State<Intro_> createState() => _Intro_State();
}

class _Intro_State extends State<Intro_> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, 'one');
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://i.pinimg.com/originals/14/d5/06/14d5066da138b0f91f082f2ae60d6169.gif",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
