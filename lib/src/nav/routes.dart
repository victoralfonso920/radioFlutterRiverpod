import 'dart:io';

import 'package:flutter/material.dart';

import '../ui/features/home/home.dart';
import '../ui/features/init/splash_screen.dart';

class Routes {
  static const splash = '/';
   static const home = 'home';


  Route routes(RouteSettings settings) {
    //final args = settings.arguments;

    switch (settings.name) {
      case splash:
        return _createRoute(
          settings,
          (context) =>  const SplashScreen(),
        );
      case home:
       return _createRoute(
        settings,
        (context) => const HomeScreen(),
       );
    }
    throw Exception('This route does not exist');
  }

  Route _createRoute(
    RouteSettings? settings,
    Widget Function(BuildContext context) predicated,
  ) {
    if (Platform.isIOS) {
      return MaterialPageRoute(
          builder: (context) => predicated(context), settings: settings);
    }
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) =>
          predicated(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
