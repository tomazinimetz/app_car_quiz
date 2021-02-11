import 'package:app/domain/quiz/models/question_model.dart';
import 'package:app/domain/quiz/quiz_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  QuizState state;
  var question_1;
  var question_2;
  var question_3;
  var question_4;
  var question_5;
  var questions = List<Question>();

  setUpAll(() async {
    question_1 = Question(question: "BMW", answer: "Alemanha");
    question_2 = Question(question: "Toyota", answer: "Japão");
    question_3 = Question(question: "Mini", answer: "Inglaterra");
    question_4 = Question(question: "Rolls Royce", answer: "Inglaterra");
    question_5 = Question(question: "General Motors", answer: "USA");
    questions
        .addAll([question_1, question_2, question_3, question_4, question_5]);

    state = QuizState();

    state.questions = questions;
    state.currentQuestion = 0;
  });

  group("NextQuestion Method test", () {
    testWidgets('Should increment current question',
        (WidgetTester tester) async {
      expect(state.currentQuestion, 0);

      state.nextQuestion();

      expect(state.currentQuestion, 1);
    });

    testWidgets('Shouldnt increment current question',
        (WidgetTester tester) async {
      state.currentQuestion = 5;

      expect(state.currentQuestion, 5);
      state.nextQuestion();

      expect(state.currentQuestion, 5);
    });
  });

  group("Scorekeeper tests", () {
    testWidgets('Should add on score if user picked the correct answer',
        (WidgetTester tester) async {
      state.scoreKeeper = 0;
      state.currentQuestion = 0;

      expect(state.scoreKeeper, 0);

      state.checkAnswer("Alemanha");

      expect(state.scoreKeeper, 1);
    });
    testWidgets('Shouldnt add on score if user picked the wrong answer',
        (WidgetTester tester) async {
      state.scoreKeeper = 0;
      state.currentQuestion = 0;

      expect(state.scoreKeeper, 0);
      state.checkAnswer("Japão");

      expect(state.scoreKeeper, 0);
    });

    testWidgets('Shouldnt reset score', (WidgetTester tester) async {
      state.scoreKeeper = 5;

      expect(state.scoreKeeper, 5);
      state.clearScore();

      expect(state.scoreKeeper, 0);
    });
  });

  testWidgets('Should reset current question', (WidgetTester tester) async {
    state.currentQuestion = 4;

    expect(state.currentQuestion, 4);

    state.reset();

    expect(state.currentQuestion, 0);
  });

  testWidgets('Should shuffle question list', (WidgetTester tester) async {
    expect(state.questions[0], question_1);
    expect(state.questions[1], question_2);
    expect(state.questions[2], question_3);
    expect(state.questions[3], question_4);
    expect(state.questions[4], question_5);

    state.shuffle();

    if (state.questions[0] != question_1) {
      expect(state.questions[4] != question_5, true);
    } else {
      expect(state.questions[4] != question_5, false);
    }
  });
}
