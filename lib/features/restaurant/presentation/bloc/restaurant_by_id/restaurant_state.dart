part of 'restaurant_bloc.dart';

sealed class RestaurantByIdState extends Equatable {
  const RestaurantByIdState();
}

final class RestaurantByIdInitial extends RestaurantByIdState {
  const RestaurantByIdInitial();

  @override
  List<Object> get props => [];
}

final class RestaurantByIdLoading extends RestaurantByIdState {
  const RestaurantByIdLoading();

  @override
  List<Object> get props => [];
}

final class RestaurantByIdSuccess extends RestaurantByIdState {
  const RestaurantByIdSuccess({required this.restaurant});

  final RestaurantEntity restaurant;
  @override
  List<Object> get props => [restaurant];
}

final class RestaurantByIdFailure extends RestaurantByIdState {
  const RestaurantByIdFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
