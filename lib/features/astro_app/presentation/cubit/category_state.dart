part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryAll extends CategoryState {
  final String category;

  const CategoryAll(this.category);
  @override
  List<Object> get props => [];
}
