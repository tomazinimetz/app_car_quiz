import 'package:app/domain/quiz/models/question_model.dart';
import 'package:hive/hive.dart';

part '../quiz_model.g.dart';

@HiveType(typeId: 0)
class QuizModel extends HiveObject {
  QuizModel(
    this.id,
    this.currentQuestion,
    this.questions,
  );

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String currentQuestion;
  @HiveField(2)
  final List<Question> questions;
}

