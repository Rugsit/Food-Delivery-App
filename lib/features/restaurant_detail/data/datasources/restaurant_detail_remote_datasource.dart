import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/core/model/restaurant.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@injectable
class RestaurantDetailRemoteDatasource {
  RestaurantDetailRemoteDatasource(this.supabase);
  final SupabaseClient supabase;

  Future<Either<Failure, RestaurantModel>> fetchRestaurantById(
    String id,
  ) async {
    try {
      final response =
          await supabase
              .from("restaurants")
              .select("*")
              .eq("id", id)
              .maybeSingle();
      if (response == null) {
        return Either.left(
          FetchFailure(errorMessage: 'No restaurant found in the database'),
        );
      } else {
        final RestaurantModel restaurant = RestaurantModel.fromJson(response);
        return Either.right(restaurant);
      }
    } on PostgrestException catch (e) {
      return Either.left(FetchFailure(errorMessage: e.message));
    } on Exception catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }
}
