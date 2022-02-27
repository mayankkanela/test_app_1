import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app_1/core/error/failures.dart';
import 'package:test_app_1/core/usecase/use_case.dart';
import 'package:test_app_1/features/astro_app/domain/entity/relative.dart';
import 'package:test_app_1/features/astro_app/domain/repositories/relatives_repository.dart';

class UpdateRelative implements UseCase<bool, UpdateRelativeParam> {
  final RelativesRepository _relativesRepository;

  UpdateRelative(this._relativesRepository);

  @override
  Future<Either<Failure, bool>> call(UpdateRelativeParam params) async =>
      _relativesRepository.updateRelative(relative: params.relative);
}

class UpdateRelativeParam extends Equatable {
  final Relative relative;

  const UpdateRelativeParam({required this.relative});

  @override
  List<Object?> get props => [relative];
}
