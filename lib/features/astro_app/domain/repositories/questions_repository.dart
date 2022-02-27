import 'package:dartz/dartz.dart';
import 'package:test_app_1/core/error/failures.dart';
import 'package:test_app_1/features/astro_app/domain/entity/question.dart';

abstract class QuestionsRepository {
  Future<Either<Failure, List<Question>>> getQuestions();
}
