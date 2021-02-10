import 'package:app/domain/quiz/models/quiz_model.dart';

abstract class QuizRepository {
   Future<QuizModel> fetchQuiz();
}
