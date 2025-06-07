import 'package:ecommerce_project/features/restaurant/domain/entities/restaurant.dart';
import 'package:ecommerce_project/features/restaurant/domain/usecase/fetch_restaurants_by_type.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

@injectable
class RestaurantByTypeBloc
    extends Bloc<RestaurantByTypeEvent, RestaurantByTypeState> {
  RestaurantByTypeBloc(this.fetchRestaurantByType)
    : super(const RestaurantInitial()) {
    on<FetchRestaurantByType>(_onFetchRestaurantsByType);
  }

  final FetchRestaurantsByTypeUseCase fetchRestaurantByType;

  Future<void> _onFetchRestaurantsByType(
    FetchRestaurantByType event,
    Emitter<RestaurantByTypeState> emit,
  ) async {
    emit(const RestaurantByTypeLoading());

    final response = await fetchRestaurantByType.call(event.type);

    response.fold(
      (left) => emit(RestaurantByTypeFailure(left.toString())),
      (right) => emit(RestaurantByTypeSuccess(restaurants: right)),
    );
  }
}
