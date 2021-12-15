import 'package:ecommerce/data_provide/data_provider.dart';
import 'package:ecommerce/models/models.dart';

class CartRepository {
  final CartDataProvider dataProvider;

  CartRepository({required this.dataProvider}) : assert(dataProvider != null);

  Future<List<Cart>> getUserCart(String categoryId) async {
    return await dataProvider.getUserCart(categoryId);
  }

  Future<void> updateCart(Cart cart) async {
    await dataProvider.updateCart(cart);
  }

  Future<void> empityCart(Cart cart) async {
    await dataProvider.empityCart(cart);
  }
}
