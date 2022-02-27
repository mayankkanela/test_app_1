import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app_1/core/error/failures.dart';
import 'package:test_app_1/core/usecase/use_case.dart';
import 'package:test_app_1/features/astro_app/domain/entity/question.dart';
import 'package:test_app_1/features/astro_app/domain/repositories/questions_repository.dart';

class GetQuestions implements UseCase<List<Question>, GetQuestionsParams> {
  final QuestionsRepository _questionsRepository;

  GetQuestions(this._questionsRepository);

  @override
  Future<Either<Failure, List<Question>>> call(
          GetQuestionsParams params) async =>
      await _questionsRepository.getQuestions();
}

class GetQuestionsParams extends Equatable {
  @override
  List<Object?> get props => [];
}
