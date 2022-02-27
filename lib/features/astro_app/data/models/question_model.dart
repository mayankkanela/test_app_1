import 'package:test_app_1/features/astro_app/domain/entity/question.dart';

class QuestionModel extends Question {
  static const String jsonId = 'id';
  static const String jsonName = 'name';
  static const String jsonDescription = 'description';
  static const String jsonPrice = 'price';
  static const String jsonSuggestions = 'suggestions';

  const QuestionModel(
      {required int id,
      required String name,
      required String? description,
      required double price,
      required List<String>? suggestions})
      : super(
            id: id,
            name: name,
            description: description,
            price: price,
            suggestions: suggestions);

  factory QuestionModel.fromJSON(Map<String, dynamic> json) {
    final List<String>? suggestions = null;
    return QuestionModel(
        id: json[jsonId],
        name: json[jsonName],
        description: json[jsonDescription],
        price: json[jsonPrice],
        suggestions: suggestions);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        jsonId: id,
        jsonName: name,
        jsonPrice: price,
        jsonDescription: description,
        jsonSuggestions: suggestions
      };
}
