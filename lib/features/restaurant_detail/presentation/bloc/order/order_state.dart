part of 'order_bloc.dart';

class OrderState extends Equatable {
  const OrderState({this.totalProduct = 0, this.totalPrice = 0});

  final int totalProduct;
  final double totalPrice;

  OrderState copyWith({int? totalProduct, double? totalPrice}) {
    return OrderState(
      totalProduct: totalProduct ?? this.totalProduct,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  @override
  List<Object> get props => [totalProduct, totalPrice];
}

// final class OrderInitial extends OrderState {
//   const OrderInitial();

//   @override
//   List<Object> get props => [];
// }

// final class OrderLoading extends OrderState {
//   const OrderLoading();

//   @override
//   List<Object> get props => [];
// }

// final class OrderSuccess extends OrderState {
//   const OrderSuccess();

//   @override
//   List<Object> get props => [];
// }

// final class FoodFailure extends OrderState {
//   const FoodFailure(this.errorMessage);

//   final String errorMessage;

//   @override
//   List<Object> get props => [errorMessage];
// }
