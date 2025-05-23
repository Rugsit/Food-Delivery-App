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

final class LikeSuccess extends LikeState {
  const LikeSuccess();

  @override
  List<Object> get props => [];
}

final class LikeFailure extends LikeState {
  const LikeFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
