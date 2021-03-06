import 'package:dartz/dartz.dart';
import 'package:test_app_1/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
