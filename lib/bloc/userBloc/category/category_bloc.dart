import 'package:ecommerce/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'categoryBloc.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc({required this.categoryRepository})
      : assert(categoryRepository != null),
        super(CategoryLoading());

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is CategoryLoad) {
      yield CategoryLoading();
      try {
        print("wait here;;;;;;;;;");
        final products = await categoryRepository.getProduct();
        print("wait here");
        yield CategoryLoadSuccess(products);
      } catch (_) {
        yield CategoryOperationFailure();
      }
    }

    if (event is LoadProductByCategory) {
      try {
        //await categoryRepository.getProductByCategory("1");
        final products = await categoryRepository.getProductByCategory("1");
        yield CategoryLoadSuccess(products);
      } catch (_) {
        yield CategoryOperationFailure();
      }
    }
  }
}
