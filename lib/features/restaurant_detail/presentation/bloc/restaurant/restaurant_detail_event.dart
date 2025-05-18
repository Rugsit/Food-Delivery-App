part of 'restaurant_detail_bloc.dart';

sealed class RestaurantDetailEvent extends Equatable {
  const RestaurantDetailEvent();
}

final class FetchRestaurant extends RestaurantDetailEvent {
  const FetchRestaurant({required this.id});

  final String id;

  @override
  List<Object> get props => [id];
}
