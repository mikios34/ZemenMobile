import 'package:ecommerce/models/models.dart';
import 'package:equatable/equatable.dart';

class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderLoading extends OrderState {}

class OrderOperationSuccess extends OrderState {
  final List<Order> order;

  OrderOperationSuccess([this.order = const []]);

  @override
  List<Object> get props => [order];
}

class OrderOperationFailure extends OrderState {}
