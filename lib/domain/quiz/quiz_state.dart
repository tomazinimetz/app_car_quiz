import 'package:app/domain/quiz/models/question_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'models/quiz_model.dart';

class QuizState with ChangeNotifier {
  QuizState();

  QuizModel quiz;
  List<Question> questions;
  int currentQuestion = 0;
  int scoreKeeper = 0;

  String get question => questions[currentQuestion].question;
  String get correctAnswer => questions[currentQuestion].answer;
  bool get isFinished => currentQuestion >= questions.length - 1;

  void init(QuizModel quiz) {
    questions = quiz.questions;
    currentQuestion = int.parse(quiz.currentQuestion);
    shuffle();
  }

  shuffle() {
    questions.shuffle();
  }

  void nextQuestion() {
    if (currentQuestion < questions.length - 1) {
      currentQuestion++;
    }
  }

  void checkAnswer(String userPickedAnswer) {
    if (isFinished) {
      reset();
      clearScore();
    } else {
      if (userPickedAnswer == correctAnswer) {
        scoreKeeper++;
      }
      print(scoreKeeper);
      nextQuestion();
    }
    notifyListeners();
  }

  void reset() {
    currentQuestion = 0;
    notifyListeners();
  }

  void clearScore() {
    scoreKeeper = 0;
    notifyListeners();
  }
}
