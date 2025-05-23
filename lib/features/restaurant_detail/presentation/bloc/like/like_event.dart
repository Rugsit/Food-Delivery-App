part of 'like_bloc.dart';

sealed class LikeEvent extends Equatable {
  const LikeEvent();
}

final class LikeRestaurant extends LikeEvent {
  const LikeRestaurant({required this.userId, required this.restaurantId});

  final String userId;
  final String restaurantId;

  @override
  List<Object> get props => [restaurantId];
}
