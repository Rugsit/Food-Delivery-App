import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/authentication/data/models/user.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@injectable
class AuthRemoteDatasource {
  AuthRemoteDatasource(this.supabase);
  final SupabaseClient supabase;

  Future<Either<Failure, UserModel>> register(UserModel user) async {
    try {
      final response = await supabase.auth.signUp(
        email: user.email,
        password: user.password,
      );

      if (response.user != null) {
        await supabase.from('users').insert({
          'id': response.user!.id,
          'firstName': user.firstName,
          'lastName': user.lastName,
          'userName': user.userName,
          'email': user.email,
          'phoneNumber': user.phoneNumber,
        });
      } else {
        throw Exception('User registration failed');
      }
      return Either.right(user);
    } on AuthApiException catch (e) {
      return Either.left(AuthFailure(errorMessage: e.message));
    } on PostgrestException catch (e) {
      return Either.left(AuthFailure(errorMessage: e.message));
    } on Exception catch (e) {
      return Either.left(AuthFailure(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, UserModel>> login(
    String email,
    String password,
  ) async {
    try {
      await supabase.auth.signInWithPassword(email: email, password: password);

      final user =
          await supabase
              .from("users")
              .select()
              .eq("email", email)
              .maybeSingle();

      if (user == null) {
        return Either.left(AuthFailure(errorMessage: 'User not found'));
      }
      return Either.right(
        UserModel(
          id: user["id"],
          firstName: user["firstName"],
          lastName: user["lastName"],
          userName: user["userName"],
          email: user["email"],
          phoneNumber: user["phoneNumber"],
          password: password,
        ),
      );
    } on AuthApiException catch (e) {
      return Either.left(AuthFailure(errorMessage: e.message));
    } on PostgrestException catch (e) {
      return Either.left(AuthFailure(errorMessage: e.message));
    } on Exception catch (e) {
      return Either.left(AuthFailure(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, UserModel>> fetchUser() async {
    try {
      final user = supabase.auth.currentUser;
      final userId = user?.id;
      if (userId == null) {
        return Either.left(FetchFailure(errorMessage: "User not found"));
      }
      final response =
          await supabase.from("users").select().eq("id", userId).maybeSingle();
      if (response == null) {
        return Either.left(AuthFailure(errorMessage: 'User not found'));
      }
      return Either.right(
        UserModel(
          id: response["id"],
          firstName: response["firstName"],
          lastName: response["lastName"],
          userName: response["userName"],
          email: response["email"],
          phoneNumber: response["phoneNumber"],
          password: "",
        ),
      );
    } catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }
}
