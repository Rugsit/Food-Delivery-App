part of "category_bloc.dart";

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();
}

final class FetchCategories extends CategoryEvent {
  const FetchCategories();

  @override
  List<Object> get props => [];
}
