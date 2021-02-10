import 'package:hive/hive.dart';

part '../question_model.g.dart';

@HiveType(typeId: 1)
class Question extends HiveObject {
  Question(
    this.id,
    this.question,
    this.options,
    this.answer,
  );

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String question;
  @HiveField(2)
  final List<String> options;
  @HiveField(3)
  final String answer;
}
