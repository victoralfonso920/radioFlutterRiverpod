import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'utils/flavor/flavor_config.dart';
import 'utils/resources/strings.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'di/service_locator.dart';
import 'nav/navigation_service.dart';
import 'nav/routes.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  initState(){
      if (Platform.isAndroid) {
      setOptimalDisplayMode();
    }
    super.initState();
  }

  Future<void> setOptimalDisplayMode() async {
    final List<DisplayMode> supported = await FlutterDisplayMode.supported;
    final DisplayMode active = await FlutterDisplayMode.active;

    final List<DisplayMode> sameResolution = supported.where(
            (DisplayMode m) => m.width == active.width
            && m.height == active.height).toList()..sort(
            (DisplayMode a, DisplayMode b) =>
            b.refreshRate.compareTo(a.refreshRate));

    final DisplayMode mostOptimalMode = sameResolution.isNotEmpty
        ? sameResolution.first
        : active;

    await FlutterDisplayMode.setPreferredMode(mostOptimalMode);
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: FlavorConfig.isBannerEnabled(),
      onGenerateRoute: (settings) => Routes().routes(settings),
      navigatorKey: sl.get<NavigationService>().navigatorKey,
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        mediaQueryData: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        breakpoints: const [
          ResponsiveBreakpoint.resize(350, name: MOBILE),
          ResponsiveBreakpoint.autoScale(600, name: TABLET),
          ResponsiveBreakpoint.resize(800, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
        ],
      ),
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
