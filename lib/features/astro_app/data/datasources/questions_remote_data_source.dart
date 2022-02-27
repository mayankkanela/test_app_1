import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:test_app_1/core/constants/api_constants.dart';
import 'package:test_app_1/core/error/exceptions.dart';
import 'package:test_app_1/features/astro_app/data/models/question_model.dart';

abstract class QuestionsRemoteDataSource {
  /// Calls ...
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<QuestionModel>> getQuestions();
}

class QuestionsRemoteDataSourceImpl implements QuestionsRemoteDataSource {
  final http.Client _client;

  QuestionsRemoteDataSourceImpl(this._client);

  @override
  Future<List<QuestionModel>> getQuestions() async {
    try {
      final response = await _client.get(
          Uri.parse('${ApiConstants.baseUrl}${ApiConstants.getQuestions}'));
      if (response.statusCode == 200) {
        log(response.body);
        return (jsonDecode(response.body)["data"] as List)
            .map((e) => QuestionModel.fromJSON(e))
            .toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      log(e.toString());
      throw ServerException();
    }
  }
}
