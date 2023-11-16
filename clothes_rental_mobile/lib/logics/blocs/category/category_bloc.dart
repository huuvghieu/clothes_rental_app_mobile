import 'package:bloc/bloc.dart';
import 'package:clothes_rental_mobile/data/repositories/category_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/category_model.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  CategoryBloc(this._categoryRepository) : super(CategoryLoadingState()) {
    on<LoadCategoryEvent>((event, emit) async {
      emit(CategoryLoadingState());

      try {
        final categories = await _categoryRepository.getCategories();
        emit(CategoryLoadedState(categories!));
      } catch (e) {
        emit(CategoryErrorState(e.toString()));
      }
    });
  }
}
