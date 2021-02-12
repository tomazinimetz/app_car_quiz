import 'package:app/domain/quiz/quiz_screen.dart';
import 'package:app/domain/quiz/quiz_state.dart';
import 'package:app/domain/quiz/score_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizRoute extends StatefulWidget {
  static const name = "/quiz";

  const QuizRoute({Key key}) : super(key: key);

  @override
  _QuizRouteState createState() => _QuizRouteState();
}

class _QuizRouteState extends State<QuizRoute> {
  QuizState state;

  @override
  Widget build(BuildContext context) {
    state = Provider.of<QuizState>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: state.isFinished
              ? ScoreScreen(state: state)
              : QuizScreen(state: state),
        ),
      ),
    );
  }
}
