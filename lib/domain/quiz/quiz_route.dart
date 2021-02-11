import 'package:app/components/cards/question_card.dart';
import 'package:app/components/cards/quiz_option_card.dart';
import 'package:app/domain/quiz/quiz_state.dart';
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screen = MediaQuery.of(context).size;
    if (state == null) {
      state = Provider.of<QuizState>(context);
      final quiz = HiveServiceImpl().get('quiz').values.first;
      state.init(quiz);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(children: [
              Container(
                width: screen.width,
                height: screen.height * 0.35,
                padding: EdgeInsets.all(10),
                child: QuestionCard(
                  asset: state.questions[state.currentQuestion].asset,
                  question: state.questions[state.currentQuestion].question,
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount:
                      state.questions[state.currentQuestion].options.length,
                  itemBuilder: (context, index) => QuizOptionCard(
                    option:
                        state.questions[state.currentQuestion].options[index],
                    onTap: () => state.checkAnswer(
                        state.questions[state.currentQuestion].options[index]),
                  ),
                ),
              ),
            ]),
          ),
        ),
      );
}
