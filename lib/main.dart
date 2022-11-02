import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../src/app.dart';
import '../src/data/tools/env_keys.dart';
import '../src/data/tools/flavor_keys.dart';
import '../src/di/service_locator.dart';
import '../src/utils/flavor/flavor_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  FlavorConfig(
    flavorName: 'production',
    bannerEnabled: kDebugMode,
    debuggable: false,
    values: {
      FlavorKeys.serverUrl: dotenv.env[EnvKeys.serverUrl.value],
    },
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  init();

  runApp(
    const ProviderScope(child: App())
  );
}
