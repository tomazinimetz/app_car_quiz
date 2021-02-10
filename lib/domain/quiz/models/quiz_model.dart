import 'package:app/domain/quiz/models/question_model.dart';
import 'package:hive/hive.dart';

part '../quiz_model.g.dart';

@HiveType(typeId: 0)
class QuizModel extends HiveObject {
  QuizModel(
    this.currentQuestion,
    this.questions,
  );

  @HiveField(1)
  String currentQuestion;
  @HiveField(2)
  List<Question> questions;

//todo: change to Map<String, dynamic>
  QuizModel.fromJson(dynamic json)
      : currentQuestion = json["current_question"].toString(),
        questions = getQuestionsByJson(json["questions"]);

  static List<Question> getQuestionsByJson(List<dynamic> json) =>
      json.map((it) => Question.fromJson(it)).toList();
}
