import 'package:ecommerce/bloc/userBloc/cart/cartBloc.dart';
import 'package:ecommerce/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;

  CartBloc({required this.cartRepository})
      : assert(cartRepository != null),
        super(CartLoading());

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is LoadUserCart) {
      try {
        //await cartRepository.getProductByCategory("1");
        final products = await cartRepository.getUserCart("1");
        yield CartLoadSuccess(products);
      } catch (_) {
        yield CartOperationFailure();
      }
    }
    if (event is CartUpdate) {
      try {
        await cartRepository.updateCart(event.cart);
        //final places = await cartRepository.getUsers();
        yield CartLoadSuccess();
      } catch (_) {
        yield CartOperationFailure();
      }
    }
    if (event is EmpityCart) {
      try {
        await cartRepository.empityCart(event.cart);
        //final places = await cartRepository.getUsers();
        yield CartLoadSuccess();
      } catch (_) {
        yield CartOperationFailure();
      }
    }
  }
}
