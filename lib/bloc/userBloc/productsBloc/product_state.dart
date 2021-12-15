import 'package:ecommerce/models/models.dart';
import 'package:equatable/equatable.dart';

class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {}

class ProductLoadSuccess extends ProductState {
  final List<Product> product;

  ProductLoadSuccess([this.product = const []]);

  @override
  List<Object> get props => [product];
}

class ProductOperationFailure extends ProductState {}
