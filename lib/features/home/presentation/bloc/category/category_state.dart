part of "category_bloc.dart";

sealed class CategoryState extends Equatable {
  const CategoryState();
}

final class CategoryInitial extends CategoryState {
  const CategoryInitial();

  @override
  List<Object> get props => [];
}

final class CategoryLoading extends CategoryState {
  const CategoryLoading();

  @override
  List<Object> get props => [];
}

final class CategorySuccess extends CategoryState {
  const CategorySuccess({required this.categories});

  final List<CategoryEntity> categories;
  @override
  List<Object> get props => [categories];
}

final class CategoryFailure extends CategoryState {
  const CategoryFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
