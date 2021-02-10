import 'dart:convert';

import 'package:app/domain/quiz/models/quiz_model.dart';
import 'package:app/domain/quiz/repository/quiz_repository.dart';
import 'package:app/shared/services/hive_service_impl.dart';
import 'package:flutter/services.dart';

class QuizRepositoryImpl extends QuizRepository {
  @override
  Future fetchQuiz() async {
    final response = await parseJson();
    final quiz = QuizModel.fromJson(response);
    await HiveServiceImpl().saveData('quiz', quiz);
  }

  Future<String> _loadFromAsset() async {
    return await rootBundle.loadString("assets/data.json");
  }

  Future parseJson() async {
    String jsonString = await _loadFromAsset();
    return jsonDecode(jsonString);
  }
}
