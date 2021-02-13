import 'package:app/domain/quiz/models/quiz_model.dart';
import 'package:app/domain/quiz/service/quiz_service.dart';
import 'package:app/shared/services/hive_service_impl.dart';
import 'package:app/utils/json_utils.dart';
import 'package:get_it/get_it.dart';

import '../models/quiz_model.dart';
import '../repository/quiz_repository.dart';

class QuizServiceImpl extends QuizService {
  final QuizRepository _repository = GetIt.I.get<QuizRepository>();

   //Para carregar os dados sem uso do backend (com o arquivo data.json) basta comentar a linha 16 e descomentar a linha 17.
  @override
  Future fetchQuiz() async {
    var response = await _repository.fetchQuiz();
    //final response = await JsonUtils.parseJson();
    final quiz = QuizModel.fromJson(response);
    await HiveServiceImpl().saveData('quiz', quiz);
  }
}
