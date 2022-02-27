import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(const CategoryAll("Others"));

  void changeCategory({required String category}) {
    emit(CategoryAll(category));
  }
}
