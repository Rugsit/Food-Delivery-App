part of 'like_bloc.dart';

sealed class LikeEvent extends Equatable {
  const LikeEvent();
}

final class LikeRestaurant extends LikeEvent {
  const LikeRestaurant({required this.userId, required this.restaurantId});

  final String userId;
  final String restaurantId;

  @override
  List<Object> get props => [restaurantId, userId];
}

final class UnlikeRestaurant extends LikeEvent {
  const UnlikeRestaurant({required this.userId, required this.restaurantId});

  final String userId;
  final String restaurantId;

  @override
  List<Object> get props => [restaurantId, userId];
}

final class FetchLikeList extends LikeEvent {
  const FetchLikeList({required this.userId, required this.restaurantIdList});

  final String userId;
  final List<String> restaurantIdList;

  @override
  List<Object> get props => [restaurantIdList, userId];
}

final class FetchLike extends LikeEvent {
  const FetchLike({required this.userId, required this.restaurantId});

  final String userId;
  final String restaurantId;

  @override
  List<Object> get props => [restaurantId, userId];
}
