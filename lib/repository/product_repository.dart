import 'package:ecommerce/data_provide/data_provider.dart';
import 'package:ecommerce/models/models.dart';

class ProductRepository {
  final ProductDataProvider dataProvider;

  ProductRepository({required this.dataProvider})
      : assert(dataProvider != null);

  Future<Product> createProduct(Product product) async {
    return await dataProvider.createProduct(product);
  }

  Future<List<Product>> getProduct() async {
    print(await dataProvider.getProduct());
    return await dataProvider.getProduct();
  }

  Future<List<Product>> getProductByCategory(String categoryId) async {
    //print(await dataProvider.getProduct());
    return await dataProvider.getProductByCategory(categoryId);
  }

  Future<void> updateProduct(Product product) async {
    await dataProvider.updateProduct(product);
  }

  Future<void> deleteProduct(String id) async {
    await dataProvider.deleteProduct(id);
  }
}
