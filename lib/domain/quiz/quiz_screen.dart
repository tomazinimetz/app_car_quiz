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
          itemCount: state.questions[state.currentQuestion].options.length,
          itemBuilder: (context, index) => QuizOptionCard(
            option: state.questions[state.currentQuestion].options[index],
            onTap: () => state.reply(index),
          ),
        ),
      ),
    ]);
  }
}
