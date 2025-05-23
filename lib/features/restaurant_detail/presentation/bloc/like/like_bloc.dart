import 'package:ecommerce_project/features/restaurant_detail/domain/usecases/like.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'like_event.dart';
part 'like_state.dart';

@injectable
class FoodBloc extends Bloc<LikeEvent, LikeState> {
  FoodBloc(this.likeUseCase) : super(const LikeInitial()) {
    on<LikeRestaurant>(_onLikeRestaurant);
  }

  final LikeUseCase likeUseCase;

  Future<void> _onLikeRestaurant(
    LikeRestaurant event,
    Emitter<LikeState> emit,
  ) async {
    emit(const LikeLoading());

    final response = await likeUseCase.call(event.restaurantId, event.userId);

    response.fold(
      (left) => emit(LikeFailure(left.toString())),
      (right) => emit(LikeSuccess()),
    );
  }
}
