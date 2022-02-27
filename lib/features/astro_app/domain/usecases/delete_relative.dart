import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app_1/core/error/failures.dart';
import 'package:test_app_1/core/usecase/use_case.dart';
import 'package:test_app_1/features/astro_app/domain/entity/relative.dart';
import 'package:test_app_1/features/astro_app/domain/repositories/relatives_repository.dart';

class DeleteRelative implements UseCase<bool, DeleteRelativeParam> {
  final RelativesRepository _relativesRepository;

  DeleteRelative(this._relativesRepository);

  @override
  Future<Either<Failure, bool>> call(DeleteRelativeParam params) async =>
      _relativesRepository.deleteRelative(relative: params.relative);
}

class DeleteRelativeParam extends Equatable {
  final Relative relative;

  const DeleteRelativeParam({required this.relative});

  @override
  List<Object?> get props => [relative];
}
