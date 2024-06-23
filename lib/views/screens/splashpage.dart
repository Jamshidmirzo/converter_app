import 'dart:async';

import 'package:converter_app/views/screens/bottomnavpage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class Splashpage extends StatefulWidget {
  Function changeMainTheme;
  Splashpage({super.key, required this.changeMainTheme});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (ctx) {
      if (ctx.tick == 3) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (ctx) {
              return Bottomnavpage(changeMainTheme: widget.changeMainTheme);
            },
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/lotties/splash.json'),
      ),
    );
  }
}
