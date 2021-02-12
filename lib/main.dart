import 'package:app/app/app.dart';
import 'package:app/shared/services/hive_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = FlutterError.dumpErrorToConsole;

  await HiveService.init();
  await DotEnv.load();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(App());
}
