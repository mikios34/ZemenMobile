import 'package:ecommerce/data_provide/data_provider.dart';
import 'package:ecommerce/models/models.dart';

class CategoryRepository {
  final CategoryDataProvider dataProvider;

  CategoryRepository({required this.dataProvider})
      : assert(dataProvider != null);

  Future<List<Category>> getProduct() async {
    print(await dataProvider.getCategory());
    return await dataProvider.getCategory();
  }

  Future<List<Category>> getProductByCategory(String categoryId) async {
    //print(await dataProvider.getProduct());
    return await dataProvider.getProductByCategory(categoryId);
  }
}
