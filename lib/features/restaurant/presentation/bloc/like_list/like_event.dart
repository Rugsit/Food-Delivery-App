part of 'like_bloc.dart';

sealed class LikeListEvent extends Equatable {
  const LikeListEvent();
}

final class FetchLikeList extends LikeListEvent {
  const FetchLikeList({required this.userId, required this.restaurantIdList});

  final String userId;
  final List<String> restaurantIdList;

  @override
  List<Object> get props => [restaurantIdList, userId];
}