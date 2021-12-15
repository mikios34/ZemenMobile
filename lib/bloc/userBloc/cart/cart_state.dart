import 'package:ecommerce/models/models.dart';
import 'package:equatable/equatable.dart';

class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartLoading extends CartState {}

class CartLoadSuccess extends CartState {
  final List<Cart> cart;

  CartLoadSuccess([this.cart = const []]);

  @override
  List<Object> get props => [cart];
}

class CartOperationFailure extends CartState {}
