import 'package:dartz/dartz.dart';
import 'package:test_app_1/core/error/exceptions.dart';
import 'package:test_app_1/core/error/failures.dart';
import 'package:test_app_1/core/network/network_info.dart';
import 'package:test_app_1/features/astro_app/data/datasources/questions_local_data_source.dart';
import 'package:test_app_1/features/astro_app/data/datasources/questions_remote_data_source.dart';
import 'package:test_app_1/features/astro_app/domain/entity/question.dart';
import 'package:test_app_1/features/astro_app/domain/repositories/questions_repository.dart';

class QuestionsRepositoryImpl implements QuestionsRepository {
  final NetworkInfo _networkInfo;
  final QuestionsRemoteDataSource _questionsRemoteDataSource;
  final QuestionsLocalDataSource _questionsLocalDataSource;

  QuestionsRepositoryImpl(
      {required NetworkInfo networkInfo,
      required QuestionsRemoteDataSource questionsRemoteDataSource,
      required QuestionsLocalDataSource questionsLocalDataSource})
      : _networkInfo = networkInfo,
        _questionsLocalDataSource = questionsLocalDataSource,
        _questionsRemoteDataSource = questionsRemoteDataSource;

  @override
  Future<Either<Failure, List<Question>>> getQuestions() async =>
      await _getQuestions();

  Future<Either<Failure, List<Question>>> _getQuestions() async {
    if (await _networkInfo.isConnected) {
      try {
        final remoteQuestionsData =
            await _questionsRemoteDataSource.getQuestions();
        _questionsLocalDataSource.cacheQuestions(remoteQuestionsData);
        return Right(remoteQuestionsData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localCacheQuestions =
            await _questionsLocalDataSource.getCachedQuestions();
        return Right(localCacheQuestions);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
