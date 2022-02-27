import 'package:dartz/dartz.dart';
import 'package:test_app_1/core/error/exceptions.dart';
import 'package:test_app_1/core/error/failures.dart';
import 'package:test_app_1/core/network/network_info.dart';
import 'package:test_app_1/features/astro_app/data/datasources/relatives_local_data_source.dart';
import 'package:test_app_1/features/astro_app/data/datasources/relatives_remote_data_source.dart';
import 'package:test_app_1/features/astro_app/data/models/relative_model.dart';
import 'package:test_app_1/features/astro_app/domain/entity/relative.dart';
import 'package:test_app_1/features/astro_app/domain/repositories/relatives_repository.dart';

class RelativesRepositoryImpl extends RelativesRepository {
  final NetworkInfo _networkInfo;
  final RelativesRemoteDataSource _remoteDataSource;
  final RelativesLocalDataSource _localDataSource;

  RelativesRepositoryImpl(
      {required NetworkInfo networkInfo,
      required RelativesRemoteDataSource remoteDataSource,
      required RelativesLocalDataSource localDataSource})
      : _networkInfo = networkInfo,
        _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  @override
  Future<Either<Failure, bool>> addNewRelative(
      {required Relative relative}) async {
    try {
      if (await _networkInfo.isConnected) {
        final remoteData = await _remoteDataSource.addRelative(
          RelativeModel(
            relationId: relative.relationId,
            firstName: relative.firstName,
            lastName: relative.lastName,
            gender: relative.gender,
            dateAndTimeOfBirth: relative.dateAndTimeOfBirth,
            middleName: relative.middleName,
            uuid: relative.uuid,
            fullName: relative.fullName,
            relation: relative.relation,
            birthDetailsModel: BirthDetailsModel(
                dobYear: relative.birthDetails.dobYear,
                dobMonth: relative.birthDetails.dobMonth,
                dobDay: relative.birthDetails.dobDay,
                tobHour: relative.birthDetails.tobHour,
                tobMin: relative.birthDetails.tobMin,
                meridiem: relative.birthDetails.meridiem),
            birthPlaceModel: BirthPlaceModel(
                placeName: relative.birthPlace.placeName,
                placeId: relative.birthPlace.placeId),
          ),
        );

        return const Right(true);
      } else {
        return Left(ServerFailure());
      }
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteRelative(
      {required Relative relative}) async {
    try {
      if (await _networkInfo.isConnected) {
        final remoteData = await _remoteDataSource.deleteRelative(
          RelativeModel(
            relationId: relative.relationId,
            firstName: relative.firstName,
            lastName: relative.lastName,
            gender: relative.gender,
            dateAndTimeOfBirth: relative.dateAndTimeOfBirth,
            middleName: relative.middleName,
            uuid: relative.uuid,
            fullName: relative.fullName,
            relation: relative.relation,
            birthDetailsModel: BirthDetailsModel(
                dobYear: relative.birthDetails.dobYear,
                dobMonth: relative.birthDetails.dobMonth,
                dobDay: relative.birthDetails.dobDay,
                tobHour: relative.birthDetails.tobHour,
                tobMin: relative.birthDetails.tobMin,
                meridiem: relative.birthDetails.meridiem),
            birthPlaceModel: BirthPlaceModel(
                placeName: relative.birthPlace.placeName,
                placeId: relative.birthPlace.placeId),
          ),
        );

        return const Right(true);
      } else {
        return Left(ServerFailure());
      }
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Relative>>> getAllRelative() {
    // TODO: implement getAllRelative
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> updateRelative(
      {required Relative relative}) async {
    try {
      if (await _networkInfo.isConnected) {
        final remoteData = await _remoteDataSource.updateRelative(
          RelativeModel(
            relationId: relative.relationId,
            firstName: relative.firstName,
            lastName: relative.lastName,
            gender: relative.gender,
            dateAndTimeOfBirth: relative.dateAndTimeOfBirth,
            middleName: relative.middleName,
            uuid: relative.uuid,
            fullName: relative.fullName,
            relation: relative.relation,
            birthDetailsModel: BirthDetailsModel(
                dobYear: relative.birthDetails.dobYear,
                dobMonth: relative.birthDetails.dobMonth,
                dobDay: relative.birthDetails.dobDay,
                tobHour: relative.birthDetails.tobHour,
                tobMin: relative.birthDetails.tobMin,
                meridiem: relative.birthDetails.meridiem),
            birthPlaceModel: BirthPlaceModel(
                placeName: relative.birthPlace.placeName,
                placeId: relative.birthPlace.placeId),
          ),
        );

        return const Right(true);
      } else {
        return Left(ServerFailure());
      }
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
