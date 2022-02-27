import 'package:equatable/equatable.dart';

class Question extends Equatable {
  final int id;
  final String name;
  final String? description;
  final double price;
  final List<String>? suggestions;

  const Question(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.suggestions});

  @override
  List<Object?> get props => [id, name, description, price, suggestions];
}
