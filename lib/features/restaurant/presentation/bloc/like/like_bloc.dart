import 'package:ecommerce_project/features/restaurant/domain/entities/like.dart';
import 'package:ecommerce_project/features/restaurant/domain/usecase/fetch_restaurant_liked.dart';
import 'package:ecommerce_project/features/restaurant/domain/usecase/fetch_restaurant_liked_by_id.dart';
import 'package:ecommerce_project/features/restaurant/domain/usecase/like.dart';
import 'package:ecommerce_project/features/restaurant/domain/usecase/unlike.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'like_event.dart';
part 'like_state.dart';

@injectable
class LikeBloc extends Bloc<LikeEvent, LikeState> {
  LikeBloc(
    this.likeUseCase,
    this.unlikeUseCase,
    this.fetchLikeList,
    this.fetchLike,
  ) : super(const LikeInitial()) {
    on<LikeRestaurant>(_onLikeRestaurant);
    on<UnlikeRestaurant>(_onUnlikeRestaurant);
    on<FetchLikeList>(_fetchRestaurantLiked);
    on<FetchLike>(_fetchRestaurantLikedById);
  }

  final LikeUseCase likeUseCase;
  final UnlikeUseCase unlikeUseCase;
  final FetchRestaurantLiked fetchLikeList;
  final FetchRestaurantLikedByIdUseCase fetchLike;

  Future<void> _onLikeRestaurant(
    LikeRestaurant event,
    Emitter<LikeState> emit,
  ) async {
    await likeUseCase.call(event.restaurantId, event.userId);
  }

  Future<void> _onUnlikeRestaurant(
    UnlikeRestaurant event,
    Emitter<LikeState> emit,
  ) async {
    await unlikeUseCase.call(event.restaurantId, event.userId);
  }

  Future<void> _fetchRestaurantLiked(
    FetchLikeList event,
    Emitter<LikeState> emit,
  ) async {
    emit(const FetchLikeLoading());

    final response = await fetchLikeList.call(
      event.restaurantIdList,
      event.userId,
    );

    response.fold(
      (left) => emit(LikeFailure(left.toString())),
      (right) => emit(FetchLikeListSuccess(likedList: right)),
    );
  }

  Future<void> _fetchRestaurantLikedById(
    FetchLike event,
    Emitter<LikeState> emit,
  ) async {
    emit(const FetchLikeLoading());

    final response = await fetchLike.call(event.restaurantId, event.userId);

    response.fold(
      (left) => emit(LikeFailure(left.toString())),
      (right) => emit(FetchLikeSuccess(like: right)),
    );
  }
}
