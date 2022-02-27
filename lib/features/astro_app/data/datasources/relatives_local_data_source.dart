import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_1/core/error/exceptions.dart';
import 'package:test_app_1/features/astro_app/data/models/relative_model.dart';

abstract class RelativesLocalDataSource {
  /// Gets the last cached list of [RelativeModel] which were last cached when
  /// get the user was online and fetched the data.
  ///
  ///  Throws [CacheException] for all errors or if no data is present.
  Future<List<RelativeModel>> getCachedRelatives();

  Future cacheRelatives(List<RelativeModel> instance);
}

class RelativesLocalDataSourceImpl implements RelativesLocalDataSource {
  static const _relatives = 'relatives';

  final SharedPreferences _sharedPreferences;

  RelativesLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future cacheRelatives(List<RelativeModel> instances) async =>
      _sharedPreferences.setString(
          _relatives, jsonEncode(instances.map((e) => e.toJson()).toList()));

  @override
  Future<List<RelativeModel>> getCachedRelatives() {
    try {
      final jsonString = _sharedPreferences.getString(_relatives);
      final jsonData = jsonDecode(jsonString!) as List;
      return Future.value(
          jsonData.map((e) => RelativeModel.fromJSON(e)).toList());
    } catch (e) {
      log(e.toString());
      throw CacheException();
    }
  }
}
