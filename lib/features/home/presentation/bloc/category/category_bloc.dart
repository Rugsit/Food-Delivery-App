import 'package:ecommerce_project/features/home/domain/entities/category.dart';
import 'package:ecommerce_project/features/home/domain/usecases/fetch_category.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'category_event.dart';
part 'category_state.dart';

@injectable
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(this.fetchCategories) : super(const CategoryInitial()) {
    on<FetchCategories>(_onFetchCategories);
  }

  final FetchCategoriesUseCase fetchCategories;

  Future<void> _onFetchCategories(
    FetchCategories event,
    Emitter<CategoryState> emit,
  ) async {
    emit(const CategoryLoading());

    final response = await fetchCategories.call();

    response.fold(
      (left) => emit(CategoryFailure(left.toString())),
      (right) => emit(CategorySuccess(categories: right)),
    );
  }
}
