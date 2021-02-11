import 'package:app/domain/quiz/models/question_model.dart';
import 'package:app/domain/quiz/quiz_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Should shuffle question list', (WidgetTester tester) async {
    final question_1 = Question(question: "a");
    final question_2 = Question(question: "b");
    final question_3 = Question(question: "c");
    final question_4 = Question(question: "d");
    final question_5 = Question(question: "e");
    final questions = [
      question_1,
      question_2,
      question_3,
      question_4,
      question_5
    ];

    final QuizState state = QuizState();

    state.questions = questions;

    expect(state.questions[0], question_1);
    expect(state.questions[1], question_2);
    expect(state.questions[2], question_3);
    expect(state.questions[3], question_4);
    expect(state.questions[4], question_5);

    state.shuffle();

    expect(state.questions[0] != question_1, true);
    expect(state.questions[4] != question_5, true);
  });
}
