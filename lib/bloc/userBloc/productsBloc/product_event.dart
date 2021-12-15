import 'package:ecommerce/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class ProductLoad extends ProductEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ProductCreate extends ProductEvent {
  final Product product;

  const ProductCreate(this.product);

  @override
  List<Object> get props => [product];

  @override
  String toString() => 'Product Created {product: $product}';
}

class ProductUpdate extends ProductEvent {
  final Product product;

  const ProductUpdate(this.product);

  @override
  List<Object> get props => [product];

  @override
  String toString() => 'Product Updated {product: $product}';
}

class ProductDelete extends ProductEvent {
  final Product product;

  const ProductDelete(this.product);

  @override
  List<Object> get props => [product];

  @override
  toString() => 'Product Deleted {Product: $product}';
}

class ProductLoadByCategory extends ProductEvent {
  final Product product;

  const ProductLoadByCategory(this.product);

  @override
  List<Object> get props => [];
}
