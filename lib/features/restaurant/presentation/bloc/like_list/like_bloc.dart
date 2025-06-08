import 'package:ecommerce_project/features/restaurant/domain/usecase/fetch_restaurant_liked.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'like_event.dart';
part 'like_state.dart';

@injectable
class LikeListBloc extends Bloc<LikeListEvent, LikeListState> {
  LikeListBloc(this.fetchLikeList) : super(const LikeListInitial()) {
    on<FetchLikeList>(_fetchRestaurantLiked);
  }

  final FetchRestaurantLiked fetchLikeList;

  Future<void> _fetchRestaurantLiked(
    FetchLikeList event,
    Emitter<LikeListState> emit,
  ) async {
    emit(const LikeListLoading());

    final response = await fetchLikeList.call(
      event.restaurantIdList,
      event.userId,
    );

    response.fold(
      (left) => emit(LikeListFailure(left.toString())),
      (right) => emit(FetchLikeListSuccess(likedList: right)),
    );
  }
}
