import 'package:ecommerce/bloc/userBloc/cart/cartBloc.dart';
import 'package:ecommerce/bloc/userBloc/order/orderBloc.dart';
import 'package:ecommerce/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository orderRepository;

  OrderBloc({required this.orderRepository})
      : assert(orderRepository != null),
        super(OrderLoading());

  @override
  Stream<OrderState> mapEventToState(OrderEvent event) async* {
    if (event is MakeOrder) {
      try {
        await orderRepository.makeOrder(event.order);
        yield OrderOperationSuccess();
      } catch (_) {
        yield OrderOperationFailure();
      }
    }
  }
}
