import 'dart:async';

import 'package:flutter/material.dart';
import '../../../nav/routes.dart';
import '../../../utils/resources/colors.dart';
import '../../../utils/resources/img_routes.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), (() {
      Navigator.pushReplacementNamed(
        context,
        Routes.home,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: congressBlue,
      body: Center(
        child: SizedBox(
          width: 250,
          height: 200,
          child: Image.asset(logo),
        ),
      ),
    );
  }
}