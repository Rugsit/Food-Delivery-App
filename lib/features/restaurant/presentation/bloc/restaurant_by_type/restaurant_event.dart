part of 'restaurant_bloc.dart';

sealed class RestaurantByTypeEvent extends Equatable {
  const RestaurantByTypeEvent();
}


final class FetchRestaurantByType extends RestaurantByTypeEvent {
  const FetchRestaurantByType(this.type);

  final String type;

  @override
  List<Object> get props => [type];
}
