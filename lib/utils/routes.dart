import 'package:app/domain/finish/finish_route.dart';
import 'package:app/domain/quiz/quiz_route.dart';
import 'package:app/domain/splash/splash_route.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> all() =>
  {
    QuizRoute.name: (_) => QuizRoute(),
    SplashRoute.name: (_) => SplashRoute(),
    FinishRoute.name: (_) => FinishRoute(),
  };
}