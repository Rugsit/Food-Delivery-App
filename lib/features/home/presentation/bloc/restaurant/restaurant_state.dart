part of 'restaurant_bloc.dart';

sealed class RestaurantState extends Equatable {
  const RestaurantState();
}

final class RestaurantInitial extends RestaurantState {
  const RestaurantInitial();

  @override
  List<Object> get props => [];
}

final class RestaurantLoading extends RestaurantState {
  const RestaurantLoading();

  @override
  List<Object> get props => [];
}

final class RestaurantSuccess extends RestaurantState {
  const RestaurantSuccess({required this.restaurants});

  final List<RestaurantEntity> restaurants;
  @override
  List<Object> get props => [restaurants];
}

final class RestaurantFailure extends RestaurantState {
  const RestaurantFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
