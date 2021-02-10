import 'dart:async';
import 'package:app/domain/finish/finish_route.dart';
import 'package:app/domain/quiz/quiz_route.dart';
import 'package:app/domain/quiz/repository/quiz_repository_impl.dart';
import 'package:app/shared/services/hive_service_impl.dart';
import 'package:app/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashRoute extends StatefulWidget {
  static const name = "/splash";

  const SplashRoute({Key key}) : super(key: key);

  @override
  _SplashRouteState createState() => _SplashRouteState();
}

class _SplashRouteState extends State<SplashRoute> {
  String _initialRoute = QuizRoute.name;

  @override
  void initState() {
    super.initState();
    Future.wait(
      [
        // All the Futures that will be executed while loading
        Future.microtask(init).timeout(const Duration(seconds: 15)),
        Future.delayed(const Duration(seconds: 3)),
      ],
    ).then((_) => finish()); // Runs after the Futures are completed
  }

  Future init() async {
    final hasQuiz = HiveServiceImpl().get("quiz") != null;
    if (!hasQuiz) {
      await fetchQuiz();
    } else {
      _initialRoute = FinishRoute.name;
    }
  }

  void finish() {
    Get.offNamed(_initialRoute);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _buildSplash(context),
      );

  Widget _buildSplash(BuildContext context) => Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.width * 0.2,
            child: Image.asset(Assets.splash),
          ),
        ),
      );

  Future fetchQuiz() async => await QuizRepositoryImpl().fetchQuiz();
}
