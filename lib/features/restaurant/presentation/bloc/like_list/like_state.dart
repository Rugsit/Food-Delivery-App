part of 'like_bloc.dart';

sealed class LikeListState extends Equatable {
  const LikeListState();
}

final class LikeListInitial extends LikeListState {
  const LikeListInitial();

  @override
  List<Object> get props => [];
}

final class LikeListLoading extends LikeListState {
  const LikeListLoading();

  @override
  List<Object> get props => [];
}

final class FetchLikeListSuccess extends LikeListState {
  const FetchLikeListSuccess({required this.likedList});

  final List<bool> likedList;

  @override
  List<Object?> get props => [likedList];
}

final class LikeListFailure extends LikeListState {
  const LikeListFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
