import 'dart:async';
import 'package:app/domain/finish/finish_route.dart';
import 'package:app/domain/quiz/models/question_model.dart';
import 'package:app/domain/quiz/models/quiz_model.dart';
import 'package:app/domain/quiz/quiz_route.dart';
import 'package:app/shared/services/hive_service_impl.dart';
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
      //todo add await
      fetchQuiz();
    }else{
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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.20,
            width: MediaQuery.of(context).size.width * 0.20,
            color: Colors.red,
            child: Image.asset('splash_icon'),
          ),
        ),
      );

  void fetchQuiz() async {
    final quiz = QuizModel(1, "2", List<Question>());
    await HiveServiceImpl().saveData('quiz', quiz);
  }
  //Future<QuizModel> fetchQuiz() async => await QuizRepositoryImpl().fetchQuiz();
}
