part of 'food_bloc.dart';

sealed class FoodEvent extends Equatable {
  const FoodEvent();
}

final class FetchFood extends FoodEvent {
  const FetchFood({required this.restaurantId});

  final String restaurantId;

  @override
  List<Object> get props => [restaurantId];
}
