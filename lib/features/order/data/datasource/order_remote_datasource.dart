import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/order/data/models/order.dart';
import 'package:ecommerce_project/features/order/domain/entities/order.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@injectable
class OrderRemoteDatasource {
  OrderRemoteDatasource(this.supabase);
  final SupabaseClient supabase;

  Future<Either<Failure, List<OrderModel>>> fetchOrder(String userId) async {
    try {
      final response = await supabase
          .from("orders")
          .select("*")
          .eq("user_id", userId);
      if (response.isEmpty) {
        return Either.left(FetchFailure(errorMessage: 'No order found.'));
      } else {
        final List<OrderModel> orders =
            response.map((item) {
              return OrderModel.fromJson(item);
            }).toList();
        return Either.right(orders);
      }
    } on PostgrestException catch (e) {
      return Either.left(FetchFailure(errorMessage: e.message));
    } on Exception catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, OrderEntity>> addOrder(OrderEntity order) async {
    try {
      final response = await supabase.from("orders").insert({
        "food_id": order.foodId,
        "user_id": order.userId,
        "amount": order.amount,
        "name": order.name,
        "price": order.price,
        "img": order.img,
      });
      if (response.error != null) {
        return Either.left(
          FetchFailure(errorMessage: 'Failure to add new order.'),
        );
      } else {
        return Either.right(order);
      }
    } on PostgrestException catch (e) {
      return Either.left(FetchFailure(errorMessage: e.message));
    } on Exception catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, OrderModel>> updateOrder({
    required OrderEntity orderEntity,
  }) async {
    try {
      final order =
          await supabase.from("orders").select().match({
            "food_id": orderEntity.foodId,
            "user_id": orderEntity.userId,
          }).maybeSingle();
      if (order == null) {
        await supabase.from("orders").insert({
          "food_id": orderEntity.foodId,
          "user_id": orderEntity.userId,
          "amount": orderEntity.amount,
          "name": orderEntity.name,
          "price": (orderEntity.price).toInt(),
          "img": orderEntity.img,
        });
      } else {
        if (orderEntity.amount + order["amount"] <= 0) {
          await supabase.from("orders").delete().match({
            "food_id": orderEntity.foodId,
            "user_id": orderEntity.userId,
          });
        } else {
          await supabase
              .from("orders")
              .update({"amount": orderEntity.amount + order["amount"]})
              .match({
                "food_id": orderEntity.foodId,
                "user_id": orderEntity.userId,
              })
              .maybeSingle();
        }
      }
      return Either.right(
        OrderModel(
          userId: orderEntity.userId,
          foodId: orderEntity.foodId,
          amount: orderEntity.amount,
          name: orderEntity.name,
          price: (orderEntity.price).toInt(),
          img: orderEntity.img,
        ),
      );
    } on PostgrestException catch (e) {
      return Either.left(UpdateFailure(errorMessage: e.message));
    } on Exception catch (e) {
      return Either.left(UpdateFailure(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, OrderModel>> deleteOrder({
    required String foodId,
    required String userId,
  }) async {
    try {
      final response = await supabase.from("orders").delete().match({
        "food_id": foodId,
        "user_id": userId,
      });
      if (response.error != null) {
        return Either.left(
          FetchFailure(errorMessage: 'Can\' delete an order.'),
        );
      } else {
        return Either.right(response);
      }
    } on PostgrestException catch (e) {
      return Either.left(FetchFailure(errorMessage: e.message));
    } on Exception catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }
}
