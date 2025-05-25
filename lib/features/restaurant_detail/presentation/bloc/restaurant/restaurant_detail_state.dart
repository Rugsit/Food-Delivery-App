part of 'restaurant_detail_bloc.dart';

sealed class RestaurantDetailState extends Equatable {
  const RestaurantDetailState();
}

final class RestaurantDetailInitial extends RestaurantDetailState {
  const RestaurantDetailInitial();

  @override
  List<Object> get props => [];
}

final class RestaurantDetailLoading extends RestaurantDetailState {
  const RestaurantDetailLoading();

  @override
  List<Object> get props => [];
}

final class RestaurantDetailSuccess extends RestaurantDetailState {
  const RestaurantDetailSuccess({required this.restaurant});

  final RestaurantDetailEntity restaurant;
  @override
  List<Object> get props => [restaurant];
}

final class RestaurantDetailFailure extends RestaurantDetailState {
  const RestaurantDetailFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
