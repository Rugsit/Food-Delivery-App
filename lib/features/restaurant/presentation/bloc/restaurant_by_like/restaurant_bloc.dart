import 'package:ecommerce_project/features/restaurant/domain/entities/restaurant.dart';
import 'package:ecommerce_project/features/restaurant/domain/usecase/fetch_restaurant_by_like.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

@injectable
class RestaurantByLikeBloc
    extends Bloc<RestaurantByLikeEvent, RestaurantByLikeState> {
  RestaurantByLikeBloc(this.fetchRestaurantByLike)
    : super(const RestaurantByLikeInitial()) {
    on<FetchRestaurantByLike>(_onFetchRestaurantsByType);
  }

  final FetchRestaurantsByLikeUseCase fetchRestaurantByLike;

  Future<void> _onFetchRestaurantsByType(
    FetchRestaurantByLike event,
    Emitter<RestaurantByLikeState> emit,
  ) async {
    emit(const RestaurantByLikeLoading());

    final response = await fetchRestaurantByLike.call(event.userId);

    response.fold(
      (left) => emit(RestaurantByLikeFailure(left.toString())),
      (right) => emit(RestaurantByLikeSuccess(restaurants: right)),
    );
  }
}
