import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/restaurant/data/models/food.dart';
import 'package:ecommerce_project/features/restaurant/data/models/like.dart';
import 'package:ecommerce_project/features/restaurant/data/models/restaurant.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@injectable
class RestaurantRemoteDataSource {
  RestaurantRemoteDataSource(this.supabase);
  final SupabaseClient supabase;

  Future<Either<Failure, List<RestaurantModel>>> fetchRestaurant() async {
    try {
      final response = await supabase.from("restaurants").select("*");
      if (response.isEmpty) {
        return Either.left(
          FetchFailure(errorMessage: 'No restaurants found in the database'),
        );
      } else {
        final List<RestaurantModel> restaurants =
            response.map((item) {
              return RestaurantModel.fromJson(item);
            }).toList();
        return Either.right(restaurants);
      }
    } on PostgrestException catch (e) {
      return Either.left(FetchFailure(errorMessage: e.message));
    } on Exception catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }

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

  Future<Either<Failure, List<FoodModel>>> fetchFoodByRestaurantId(
    String restaurantId,
  ) async {
    try {
      final response = await supabase
          .from("foods")
          .select("*")
          .eq("restaurant_id", restaurantId);
      if (response.isEmpty) {
        return Either.left(
          FetchFailure(
            errorMessage:
                'No food that match restaurant id found in the database',
          ),
        );
      } else {
        final List<FoodModel> food =
            response.map((item) => FoodModel.fromJson(item)).toList();
        return Either.right(food);
      }
    } on PostgrestException catch (e) {
      return Either.left(FetchFailure(errorMessage: e.message));
    } on Exception catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, LikeModel>> like(
    String restaurantId,
    String userId,
  ) async {
    try {
      final response = await supabase.from("like").insert({
        "restaurant_id": restaurantId,
        "user_id": userId,
      });
      if (response != null && response.error != null) {
        return Either.left(
          InsertFailure(errorMessage: "Failure to insert like in database"),
        );
      }
      return Either.right(
        LikeModel(restaurantId: restaurantId, userId: userId),
      );
    } catch (e) {
      return Either.left(InsertFailure(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, LikeModel>> unlike(
    String restaurantId,
    String userId,
  ) async {
    try {
      final response = await supabase.from("like").delete().match({
        'user_id': userId,
        'restaurant_id': restaurantId,
      });
      if (response == null || response.error != null) {
        return Either.left(
          InsertFailure(errorMessage: "Failure to insert like in database"),
        );
      }
      return Either.right(
        LikeModel(restaurantId: restaurantId, userId: userId),
      );
    } catch (e) {
      return Either.left(DeleteFailure(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, List<bool>>> fetchRestaurantLiked(
    List<String> restaurantIdList,
    String userId,
  ) async {
    try {
      final response = await supabase
          .from("like")
          .select()
          .eq("user_id", userId);

      final restaurantList =
          response.map((item) => item["restaurant_id"] as String).toList();
      final likedList = List.filled(restaurantIdList.length, false);
      for (int index = 0; index < likedList.length; index++) {
        likedList[index] = restaurantList.contains(restaurantIdList[index]);
      }

      return Either.right(likedList);
    } catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, LikeModel?>> fetchRestaurantLikedById(
    String restaurantId,
    String userId,
  ) async {
    try {
      final response =
          await supabase.from("like").select().match({
            "restaurant_id": restaurantId,
            "user_id": userId,
          }).maybeSingle();

      if (response == null) {
        return Either.right(null);
      }
      return Either.right(
        LikeModel(
          restaurantId: response["restaurant_id"],
          userId: response["user_id"],
        ),
      );
    } catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, List<RestaurantModel>>> fetchRestaurantByType(
    String type,
  ) async {
    try {
      final response = await supabase
          .from("restaurants")
          .select('*, foods!inner(type)')
          .eq("foods.type", type);

      if (response.isEmpty) {
        return Either.left(
          FetchFailure(
            errorMessage: "Can not found restaurant that match type.",
          ),
        );
      }
      return Either.right(
        response.map((element) => RestaurantModel.fromJson(element)).toList(),
      );
    } catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, List<RestaurantModel>>> fetchRestaurantByLike(
    String userId,
  ) async {
    try {
      final response = await supabase
          .from("restaurants")
          .select('*, like!inner(restaurant_id)')
          .eq("like.user_id", userId);

      if (response.isEmpty) {
        return Either.left(
          FetchFailure(errorMessage: "Can not found restaurant that you like."),
        );
      }
      return Either.right(
        response.map((element) => RestaurantModel.fromJson(element)).toList(),
      );
    } catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }
}
