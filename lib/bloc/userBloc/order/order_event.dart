import 'package:ecommerce/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();
}

class MakeOrder extends OrderEvent {
  final Order order;

  const MakeOrder(this.order);

  @override
  List<Object> get props => [order];

  @override
  String toString() => 'Order Created {order: $order}';
}
