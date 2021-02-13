import 'package:app/domain/quiz/repository/quiz_repository.dart';
import 'package:app/shared/mixins/http_client_mixin.dart';

class QuizRepositoryImpl with HttpClientMixin implements QuizRepository {
  @override
  Future<dynamic> fetchQuiz() async {
    final response = await client.get('/quiz');
    return response.data;
  }
}
