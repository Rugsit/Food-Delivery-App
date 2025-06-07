part of 'restaurant_bloc.dart';

sealed class RestaurantByIdEvent extends Equatable {
  const RestaurantByIdEvent();
}

final class FetchRestaurantById extends RestaurantByIdEvent {
  const FetchRestaurantById(this.id);

  final String id;

  @override
  List<Object> get props => [id];
}
