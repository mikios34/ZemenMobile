import 'dart:convert';

import 'package:ecommerce/models/models.dart';

import 'package:http/http.dart' as http;

class CategoryDataProvider {
  final _baseUrl = 'http://192.168.43.74:1337/api/products';
  final http.Client httpClient;
  final url = "http://192.168.43.74:1337/api/categories";
  CategoryDataProvider({required this.httpClient}) : assert(httpClient != null);

  Future<List<Category>> getCategory() async {
    final response = await httpClient.get(url);

    if (response.statusCode == 200) {
      print("Failed to load products");
      //print(jsonDecode(response.body));

      final places = jsonDecode(response.body)["data"];
      //print(places);
      //print(Category(title: "test"));
      //print(places.map((product) => Category.fromJson(product)));
      print(response.body);
      print('dddddddddddddddddddddddddddddd');
      List x = places;
      var y;
      List<Category> prod = [];
      for (var i in x) {
        y = Category.fromJson(i);
        prod.add(y);
      }
      print(prod);
      return (prod);
      //return [Category(title: "test")];
      //return places.map((product) => Category.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<Category>> getProductByCategory(String? categoryId) async {
    print("succefull loading products");

    final http.Response response = await httpClient.get(
        'http://192.168.43.74:1337/api/categories/$categoryId?populate=products');

    if (response.statusCode == 200) {
      print('$url/$categoryId?populate=products');
      print("--------------------------------------");
      final users =
          jsonDecode(response.body)["data"]["attributes"]["products"]["data"];
      print(users);
      print("There_____________________________");
      //return users.map((user) => Category.fromJson(user)).toList();
      return [Category(name: "abeb", products: users)];
      //return users.map((product) => Category.fromJson(product)).toList();
    } else {
      print("succefull loading products");

      throw Exception('Failed to load products');
    }
  }
}
