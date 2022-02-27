import 'package:dartz/dartz.dart';
import 'package:test_app_1/core/error/failures.dart';
import 'package:test_app_1/features/astro_app/domain/entity/relative.dart';

abstract class RelativesRepository {
  Future<Either<Failure, List<Relative>>> getAllRelative();

  Future<Either<Failure, bool>> addNewRelative({required Relative relative});

  Future<Either<Failure, bool>> updateRelative({required Relative relative});

  Future<Either<Failure, bool>> deleteRelative({required Relative relative});
}
