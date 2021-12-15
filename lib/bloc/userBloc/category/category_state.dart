import 'package:ecommerce/models/models.dart';
import 'package:equatable/equatable.dart';

class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryLoading extends CategoryState {}

class CategoryLoadSuccess extends CategoryState {
  final List<Category> category;

  CategoryLoadSuccess([this.category = const []]);

  @override
  List<Object> get props => [category];
}

class CategoryOperationFailure extends CategoryState {}
