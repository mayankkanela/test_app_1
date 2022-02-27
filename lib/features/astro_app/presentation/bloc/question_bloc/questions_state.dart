part of 'questions_bloc.dart';

abstract class QuestionsState extends Equatable {
  const QuestionsState();
}

class QuestionsInitial extends QuestionsState {
  @override
  List<Object> get props => [];
}

class QuestionsLoaded extends QuestionsState {
  final List<Question> questions;
  late final List<String> categories;

  QuestionsLoaded({required this.questions}) {
    final map = HashMap<String, String>.fromIterables(
        questions.map((e) => e.name), questions.map((e) => e.name));
    categories = map.entries.map((e) => e.key).toList();
  }

  @override
  List<Object?> get props => [questions];
}

class QuestionsError extends QuestionsState {
  @override
  List<Object?> get props => [];
}
