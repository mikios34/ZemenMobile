import 'package:ecommerce/data_provide/data_provider.dart';
import 'package:ecommerce/models/models.dart';

class OrderRepository {
  final OrderDataProvider dataProvider;

  OrderRepository({required this.dataProvider}) : assert(dataProvider != null);

  Future<void> makeOrder(Order order) async {
    await dataProvider.makeOrder(order);
  }
}
