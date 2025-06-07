part of 'restaurant_bloc.dart';

sealed class RestaurantByLikeState extends Equatable {
  const RestaurantByLikeState();
}

final class RestaurantByLikeInitial extends RestaurantByLikeState {
  const RestaurantByLikeInitial();

  @override
  List<Object> get props => [];
}

final class RestaurantByLikeLoading extends RestaurantByLikeState {
  const RestaurantByLikeLoading();

  @override
  List<Object> get props => [];
}

final class RestaurantByLikeSuccess extends RestaurantByLikeState {
  const RestaurantByLikeSuccess({required this.restaurants});

  final List<RestaurantEntity> restaurants;
  @override
  List<Object> get props => [restaurants];
}

final class RestaurantByLikeFailure extends RestaurantByLikeState {
  const RestaurantByLikeFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
