import 'package:app/components/cards/question_card.dart';
import 'package:app/components/cards/quiz_option_card.dart';
import 'package:app/domain/quiz/quiz_state.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({
    Key key,
    this.state,
  })  : assert(state != null),
        super(key: key);

  final QuizState state;

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Column(children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.38,
        child: QuestionCard(
          asset: state.questions[state.currentQuestion].asset,
          question: state.questions[state.currentQuestion].question,
        ),
      ),
      Expanded(
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
              state.questions[state.currentQuestion].options.length, (index) {
            return Container(
              margin: EdgeInsets.all(20),
              child: QuizOptionCard(
                option: state.questions[state.currentQuestion].options[index],
                onTap: () => state.reply(index),
              ),
            );
          }),
        ),
      ),
    ]);
  }
}
