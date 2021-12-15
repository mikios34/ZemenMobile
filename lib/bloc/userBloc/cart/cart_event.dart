import 'package:ecommerce/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class LoadUserCart extends CartEvent {
  final Cart cart;

  const LoadUserCart(this.cart);

  @override
  List<Object> get props => [];
}

class CartUpdate extends CartEvent {
  final Cart cart;

  const CartUpdate(this.cart);

  @override
  List<Object> get props => [cart];

  @override
  String toString() => 'Place Updated {cart: $cart}';
}

class EmpityCart extends CartEvent {
  final Cart cart;

  const EmpityCart(this.cart);

  @override
  List<Object> get props => [cart];

  @override
  String toString() => 'Empytied Cart {cart: $cart}';
}
