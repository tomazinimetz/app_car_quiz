import 'package:app/domain/quiz/models/quiz_model.dart';
import 'package:app/domain/quiz/quiz_screen.dart';
import 'package:app/domain/quiz/quiz_state.dart';
import 'package:app/domain/quiz/score_screen.dart';
import 'package:app/domain/quiz/service/quiz_service_impl.dart';
import 'package:app/shared/services/hive_service_impl.dart';
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
  Size screen;
  QuizModel quiz;

  @override
  Future didChangeDependencies() async {
    super.didChangeDependencies();
    if (state == null) {
      state = Provider.of<QuizState>(context);
      if (HiveServiceImpl().get('quiz') == null) {
        await QuizServiceImpl().fetchQuiz();
      }
      quiz = HiveServiceImpl().get('quiz').values.first;
      state.init(quiz);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
