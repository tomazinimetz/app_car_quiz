
import 'package:app/domain/quiz/models/question_model.dart';
import 'package:app/domain/quiz/models/quiz_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

abstract class HiveService {
  static Future init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.registerAdapter(QuizModelAdapter());
    Hive.registerAdapter(QuestionAdapter());
    Hive.init(dir.path);
  }

  Future saveData(String boxName, dynamic data);
  void deleteBoxes();
  Box get(String boxName);
}