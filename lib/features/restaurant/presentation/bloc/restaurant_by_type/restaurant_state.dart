part of 'restaurant_bloc.dart';

sealed class RestaurantByTypeState extends Equatable {
  const RestaurantByTypeState();
}

final class RestaurantInitial extends RestaurantByTypeState {
  const RestaurantInitial();

  @override
  List<Object> get props => [];
}

final class RestaurantByTypeLoading extends RestaurantByTypeState {
  const RestaurantByTypeLoading();

  @override
  List<Object> get props => [];
}

final class RestaurantByTypeSuccess extends RestaurantByTypeState {
  const RestaurantByTypeSuccess({required this.restaurants});

  final List<RestaurantEntity> restaurants;
  @override
  List<Object> get props => [restaurants];
}

final class RestaurantByTypeFailure extends RestaurantByTypeState {
  const RestaurantByTypeFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
