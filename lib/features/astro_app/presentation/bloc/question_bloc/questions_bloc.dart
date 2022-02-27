import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app_1/features/astro_app/domain/entity/question.dart';
import 'package:test_app_1/features/astro_app/domain/usecases/get_questions.dart';

part 'questions_event.dart';
part 'questions_state.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  final GetQuestions _getQuestions;

  QuestionsBloc({required GetQuestions getQuestions})
      : _getQuestions = getQuestions,
        super(QuestionsInitial()) {
    on<GetQuestionsEvent>((event, emit) async {
      final data = await _getQuestions(GetQuestionsParams());
      data.fold((l) => emit(QuestionsError()),
          (r) => emit(QuestionsLoaded(questions: r)));
    });
  }
}
