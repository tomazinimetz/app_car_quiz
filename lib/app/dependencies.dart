import 'package:app/domain/quiz/repository/quiz_repository.dart';
import 'package:app/domain/quiz/repository/quiz_repository_impl.dart';
import 'package:app/domain/quiz/service/quiz_service.dart';
import 'package:app/domain/quiz/service/quiz_service_impl.dart';
import 'package:app/shared/providers/http_client.dart';
import 'package:app/shared/services/hive_service.dart';
import 'package:app/shared/services/hive_service_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

class Dependencies {
  static void register(instance) {
    instance.registerLazySingleton<HiveService>(() => HiveServiceImpl());
    instance.registerLazySingleton<QuizService>(() => QuizServiceImpl());
    instance.registerLazySingleton<QuizRepository>(() => QuizRepositoryImpl());

    instance.registerSingleton<HttpClient>(
        HttpClient(Dio(), DotEnv.env['BASE_URL']));
  }
}
