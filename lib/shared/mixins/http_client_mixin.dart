import 'package:app/shared/providers/http_client.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

mixin HttpClientMixin {
  Dio getClient() => GetIt.I.get<HttpClient>().client;
}
