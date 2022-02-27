import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_1/core/error/exceptions.dart';
import 'package:test_app_1/features/astro_app/data/models/question_model.dart';

abstract class QuestionsLocalDataSource {
  /// Gets the last cached list of [QuestionModel] which were last cached when
  /// get the user was online and fetched the data.
  ///
  ///  Throws [CacheException] for all errors or if no data is present.
  Future<List<QuestionModel>> getCachedQuestions();

  Future cacheQuestions(List<QuestionModel> instance);
}

class QuestionsLocalDataSourceImpl implements QuestionsLocalDataSource {
  static const _questions = 'questions';

  final SharedPreferences _sharedPreferences;

  QuestionsLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future cacheQuestions(List<QuestionModel> instances) async =>
      _sharedPreferences.setString(
          _questions, jsonEncode(instances.map((e) => e.toJson()).toList()));

  @override
  Future<List<QuestionModel>> getCachedQuestions() {
    try {
      final jsonString = _sharedPreferences.getString(_questions);
      final jsonData = jsonDecode(jsonString!) as List;
      return Future.value(
          jsonData.map((e) => QuestionModel.fromJSON(e)).toList());
    } catch (e) {
      log(e.toString());
      throw CacheException();
    }
  }
}
