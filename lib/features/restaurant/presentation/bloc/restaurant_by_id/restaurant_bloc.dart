import 'package:ecommerce_project/features/restaurant/domain/entities/restaurant.dart';
import 'package:ecommerce_project/features/restaurant/domain/usecase/fetch_restaurant_by_id.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

@injectable
class RestaurantByIdBloc extends Bloc<RestaurantByIdEvent, RestaurantByIdState> {
  RestaurantByIdBloc(this.fetchRestaurantById) : super(const RestaurantByIdInitial()) {
    on<FetchRestaurantById>(_onFetchRestaurantsById);
  }

  final FetchRestaurantByIdUseCase fetchRestaurantById;

  Future<void> _onFetchRestaurantsById(
    FetchRestaurantById event,
    Emitter<RestaurantByIdState> emit,
  ) async {
    emit(const RestaurantByIdLoading());

    final response = await fetchRestaurantById.call(event.id);

    response.fold(
      (left) => emit(RestaurantByIdFailure(left.toString())),
      (right) => emit(RestaurantByIdSuccess(restaurant: right)),
    );
  }
}
