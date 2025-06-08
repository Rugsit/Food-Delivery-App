part of 'like_bloc.dart';

sealed class LikeState extends Equatable {
  const LikeState();
}

final class LikeInitial extends LikeState {
  const LikeInitial();

  @override
  List<Object> get props => [];
}

final class LikeLoading extends LikeState {
  const LikeLoading();

  @override
  List<Object> get props => [];
}

final class FetchLikeLoading extends LikeState {
  const FetchLikeLoading();

  @override
  List<Object> get props => [];
}

final class FetchLikeSuccess extends LikeState {
  const FetchLikeSuccess({required this.like});

  final LikeEntity? like;

  @override
  List<Object?> get props => [like];
}

final class LikeSuccess extends LikeState {
  const LikeSuccess({required this.likeEntity});

  final LikeEntity likeEntity;

  @override
  List<Object?> get props => [likeEntity];
}

final class LikeFailure extends LikeState {
  const LikeFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
