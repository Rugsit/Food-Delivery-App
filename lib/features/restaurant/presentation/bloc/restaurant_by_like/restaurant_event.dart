part of 'restaurant_bloc.dart';

sealed class RestaurantByLikeEvent extends Equatable {
  const RestaurantByLikeEvent();
}

final class FetchRestaurantByLike extends RestaurantByLikeEvent {
  const FetchRestaurantByLike(this.userId);

  final String userId;

  @override
  List<Object> get props => [userId];
}
