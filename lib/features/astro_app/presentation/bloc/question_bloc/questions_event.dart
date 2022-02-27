part of 'questions_bloc.dart';

abstract class QuestionsEvent extends Equatable {
  const QuestionsEvent();
}

class GetQuestionsEvent extends QuestionsEvent {
  @override
  List<Object?> get props => [];
}
