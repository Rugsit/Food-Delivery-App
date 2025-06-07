part of 'restaurant_bloc.dart';

sealed class RestaurantEvent extends Equatable {
  const RestaurantEvent();
}

final class FetchRestaurant extends RestaurantEvent {
  const FetchRestaurant();

  @override
  List<Object> get props => [];
}
