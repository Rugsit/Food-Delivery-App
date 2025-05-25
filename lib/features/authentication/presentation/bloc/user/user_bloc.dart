import 'package:ecommerce_project/features/authentication/domain/entities/user.dart';
import 'package:ecommerce_project/features/authentication/domain/usecases/fetch_user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part "user_event.dart";
part "user_state.dart";

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this.fetchUserUseCase) : super(const UserInitial()) {
    on<GetUser>(_onGetUser);
  }

  final FetchUserUseCase fetchUserUseCase;

  Future<void> _onGetUser(GetUser event, Emitter<UserState> emit) async {
    emit(UserLoading());

    final response = await fetchUserUseCase.call();

    response.fold(
      (left) => emit(UserFailure(left.toString())),
      (right) => emit(UserSuccess(user: right)),
    );
  }
}
