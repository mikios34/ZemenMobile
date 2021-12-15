import 'package:ecommerce/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class CategoryLoad extends CategoryEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadProductByCategory extends CategoryEvent {
  final Category category;

  const LoadProductByCategory(this.category);

  @override
  List<Object> get props => [];
}
