import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:test_app_1/core/constants/api_constants.dart';
import 'package:test_app_1/core/error/exceptions.dart';
import 'package:test_app_1/features/astro_app/data/models/relative_model.dart';

abstract class RelativesRemoteDataSource {
  /// Calls....
  ///
  /// Throws [ServerException] for all errors.
  Future<List<RelativeModel>> getAllRelative();

  /// Calls ....
  ///
  /// Throws [ServerException] for all errors.
  Future<bool> addRelative(RelativeModel relativeModel);

  /// Calls ....
  ///
  /// Throws [ServerException] for all errors.
  Future<bool> updateRelative(RelativeModel relativeModel);

  /// Calls ....
  ///
  /// Throws [ServerException] for all errors.
  Future<bool> deleteRelative(RelativeModel relativeModel);
}

class RelativesRemoteDataSourceImpl implements RelativesRemoteDataSource {
  final http.Client _client;

  RelativesRemoteDataSourceImpl(this._client);

  @override
  Future<bool> addRelative(RelativeModel relativeModel) async {
    try {
      final response = await _client.post(
          Uri.parse(
            '${ApiConstants.baseUrl}${ApiConstants.addRelative}',
          ),
          headers: {'Authorization': 'Bearer ${ApiConstants.apiToken}'},
          body: relativeModel.toJson());
      if (response.statusCode == 200) {
        return true;
      } else {
        throw ServerException();
      }
    } catch (e) {
      log(e.toString());
      throw ServerException();
    }
  }

  @override
  Future<bool> deleteRelative(RelativeModel relativeModel) async {
    try {
      final response = await _client.post(
        Uri.parse(
          '${ApiConstants.baseUrl}${ApiConstants.deleteRelative}/${relativeModel.uuid}',
        ),
        headers: {'Authorization': 'Bearer ${ApiConstants.apiToken}'},
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw ServerException();
      }
    } catch (e) {
      log(e.toString());
      throw ServerException();
    }
  }

  @override
  Future<List<RelativeModel>> getAllRelative() async {
    try {
      final response = await _client.get(
        Uri.parse(
          '${ApiConstants.baseUrl}${ApiConstants.getAllRelatives}',
        ),
        headers: {'Authorization': 'Bearer ${ApiConstants.apiToken}'},
      );
      if (response.statusCode == 200) {
        return (jsonDecode(response.body)["data"]["allRelatives"] as List)
            .map((e) => RelativeModel.fromJSON(e))
            .toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      log(e.toString());
      throw ServerException();
    }
  }

  @override
  Future<bool> updateRelative(RelativeModel relativeModel) async {
    try {
      final response = await _client.post(
          Uri.parse(
            '${ApiConstants.baseUrl}${ApiConstants.updateRelative}/${relativeModel.uuid}',
          ),
          headers: {'Authorization': 'Bearer ${ApiConstants.apiToken}'},
          body: relativeModel.toJson());
      if (response.statusCode == 200) {
        return true;
      } else {
        throw ServerException();
      }
    } catch (e) {
      log(e.toString());
      throw ServerException();
    }
  }
}
