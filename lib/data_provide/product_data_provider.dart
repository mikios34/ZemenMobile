import 'dart:convert';

import 'package:ecommerce/models/models.dart';

import 'package:http/http.dart' as http;

class ProductDataProvider {
  final _baseUrl = 'http://192.168.43.74:1337/api/products?populate=image';
  final http.Client httpClient;
  final url = "http://192.168.43.74:1337/api/categories";
  ProductDataProvider({required this.httpClient}) : assert(httpClient != null);

  Future<Product> createProduct(Product product) async {
    final response = await http.post(
      _baseUrl,
      headers: <String, String>{'Content-Type': 'application/json'},
      body: json.encode({
        'title': product.title,
        // 'image': product.image,
        'description': product.description,
        // 'rating': product.rating,
        'price': product.price,
        // 'date' : product.date
      }),
    );

    if (response.statusCode == 200) {
      print("yesssssssssssssssssssssssssssssssssss");
      return Product.fromJson(jsonDecode(response.body));
    } else {
      print(product.title);
      print(response.statusCode);
      print("nooooooooooooooooooooooooooooooooooooo");
      throw Exception('Failed to create product.');
    }
  }

  Future<List<Product>> getProduct() async {
    final response = await httpClient.get(_baseUrl);

    if (response.statusCode == 200) {
      print("Failed to load products");
      //print(jsonDecode(response.body));

      final places = jsonDecode(response.body)["data"];
      //print(places);
      //print(Product(title: "test"));
      //print(places.map((product) => Product.fromJson(product)));
      print(places);
      print('dddddddddddddddddddddddddddddd');
      List x = places;
      var y;
      List<Product> prod = [];
      for (var i in x) {
        y = Product.fromJson(i);

        prod.add(y);
      }

      print('dddddddddddddddddddddddddddddd');

      return (prod);
      //return [Product(title: "test")];
      //return places.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<void> deleteProduct(String? id) async {
    final http.Response response = await httpClient.delete(
      '$_baseUrl/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete product.');
    }
  }

  Future<void> updateProduct(Product product) async {
    final http.Response response = await http.put(
      '$_baseUrl/${product.id}',
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'id': product.id,
        'title': product.title,
        //'image': product.image,
        'description': product.description,
        // 'rating': product.rating,
        'image': product.image,
        //'date' : product.date
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update product.');
    }
  }

  Future<List<Product>> getProductByCategory(String? categoryId) async {
    print("succefull loading products");

    final http.Response response = await httpClient.get(
        'http://192.168.43.74:1337/api/products?populate=image&filters[categories][id][\$eq]=$categoryId');

    if (response.statusCode == 200) {
      print('$url/$categoryId?populate=products');
      print("--------------------------------------");
      final places = jsonDecode(response.body)["data"];
      //print(places);
      //print(Product(title: "test"));
      //print(places.map((product) => Product.fromJson(product)));
      print('dddddddddddddddddddddddddddddd');
      List x = places;
      var y;
      List<Product> prod = [];
      for (var i in x) {
        y = Product.fromJson(i);
        prod.add(y);
      }
      print('dddddddddddddddddddddddddddddd');

      return (prod);
      //return places.map((product) => Product.fromJson(product)).toList();
    } else {
      print("succefull loading products");

      throw Exception('Failed to load products');
    }
  }
}
