import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app_1/core/error/failures.dart';
import 'package:test_app_1/core/usecase/use_case.dart';
import 'package:test_app_1/features/astro_app/domain/entity/relative.dart';
import 'package:test_app_1/features/astro_app/domain/repositories/relatives_repository.dart';

class GetAllRelatives implements UseCase<List<Relative>, GetAllRelativesParam> {
  final RelativesRepository _relativesRepository;

  GetAllRelatives(this._relativesRepository);

  @override
  Future<Either<Failure, List<Relative>>> call(
          GetAllRelativesParam params) async =>
      await _relativesRepository.getAllRelative();
}

class GetAllRelativesParam extends Equatable {
  @override
  List<Object?> get props => [];
}
