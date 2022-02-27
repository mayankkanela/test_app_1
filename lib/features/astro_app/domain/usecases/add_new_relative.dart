import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app_1/core/error/failures.dart';
import 'package:test_app_1/core/usecase/use_case.dart';
import 'package:test_app_1/features/astro_app/domain/entity/relative.dart';
import 'package:test_app_1/features/astro_app/domain/repositories/relatives_repository.dart';

class AddNewRelative implements UseCase<bool, AddNewRelativeParam> {
  final RelativesRepository _relativesRepository;

  AddNewRelative(this._relativesRepository);

  @override
  Future<Either<Failure, bool>> call(AddNewRelativeParam params) async =>
      _relativesRepository.addNewRelative(relative: params.relative);
}

class AddNewRelativeParam extends Equatable {
  final Relative relative;

  const AddNewRelativeParam({required this.relative});

  @override
  List<Object?> get props => [relative];
}
