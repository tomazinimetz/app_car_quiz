import 'package:hive/hive.dart';

part 'question_model.g.dart';

@HiveType(typeId: 1)
class Question extends HiveObject {
  Question({
    this.id,
    this.question,
    this.options,
    this.answer,
    this.asset,
  });

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String question;
  @HiveField(2)
  final List<String> options;
  @HiveField(3)
  final String answer;
  @HiveField(4)
  final String asset;

  Question.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        question = json["question"],
        options =
            (json['options'] as List)?.map((it) => it as String)?.toList(),
        answer = json["answer"],
        asset = 'assets/${json["asset"]}';
}
