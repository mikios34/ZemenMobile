import 'package:ecommerce/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'productbloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({required this.productRepository})
      : assert(productRepository != null),
        super(ProductLoading());

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is ProductLoad) {
      yield ProductLoading();
      try {
        print("wait here;;;;;;;;;");
        final products = await productRepository.getProduct();
        print("wait here");
        yield ProductLoadSuccess(products);
      } catch (_) {
        yield ProductOperationFailure();
      }
    }

    if (event is ProductCreate) {
      try {
        await productRepository.createProduct(event.product);
        final products = await productRepository.getProduct();
        yield ProductLoadSuccess(products);
      } catch (_) {
        yield ProductOperationFailure();
      }
    }

    if (event is ProductUpdate) {
      try {
        await productRepository.updateProduct(event.product);
        final products = await productRepository.getProduct();
        yield ProductLoadSuccess(products);
      } catch (_) {
        yield ProductOperationFailure();
      }
    }

    if (event is ProductDelete) {
      try {
        await productRepository.deleteProduct("1");
        final products = await productRepository.getProduct();
        yield ProductLoadSuccess(products);
      } catch (_) {
        yield ProductOperationFailure();
      }
    }
    if (event is ProductLoadByCategory) {
      try {
        await productRepository.getProductByCategory("1");
        final products = await productRepository.getProductByCategory("1");
        yield ProductLoadSuccess(products);
      } catch (_) {
        yield ProductOperationFailure();
      }
    }
  }
}
