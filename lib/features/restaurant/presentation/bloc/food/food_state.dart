part of 'food_bloc.dart';

sealed class FoodState extends Equatable {
  const FoodState();
}

final class FoodInitial extends FoodState {
  const FoodInitial();

  @override
  List<Object> get props => [];
}

final class FoodLoading extends FoodState {
  const FoodLoading();

  @override
  List<Object> get props => [];
}

final class FoodSuccess extends FoodState {
  const FoodSuccess({required this.foods});

  final List<FoodEntity> foods;
  @override
  List<Object> get props => [foods];
}

final class FoodFailure extends FoodState {
  const FoodFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
