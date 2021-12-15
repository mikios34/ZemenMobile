import 'dart:convert';

import 'package:ecommerce/models/models.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;

class CartDataProvider {
  final updateUrl = 'http://192.168.43.74:1337/api/carts';
  final url =
      'http://192.168.43.74:1337/api/carts?filters[users][username][\$eq]=sosi&populate=products&fields=id';
  final http.Client httpClient;
  final storage = FlutterSecureStorage();
  CartDataProvider({required this.httpClient}) : assert(httpClient != null);

  Future<List<Cart>> getUserCart(String? categoryId) async {
    print(await storage.read(key: "cartid"));
    final username = await storage.read(key: "username");
    print("YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY");
    //print(username);
    final http.Response response = await httpClient.get(
        "http://192.168.43.74:1337/api/carts?filters[users][username][\$eq]=$username&populate=products&fields=id");

    if (response.statusCode == 200) {
      final users = jsonDecode(response.body)["data"][0]["attributes"]
          ["products"]["data"];
      //print(users.length);
      //return users.map((user) => Category.fromJson(user)).toList();
      return [Cart(products: users)];
      //return users.map((product) => Category.fromJson(product)).toList();
    } else {
      print("succefull loading products");

      throw Exception('Failed to load products');
    }
  }

  Future<void> updateCart(Cart cart) async {
    final id = await storage.read(key: "cartid");
    final data = await getUserCart("2");

    List? x = data[0].products;
    //   var y;
    List prod = [];
    for (var i in x!) {
      //print(i["id"]);
      prod.add({"id": i["id"]});
    }
    prod.add({"id": cart.productid});
    print(prod);

    final http.Response response = await httpClient.put("$updateUrl/$id",
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          "data": {
            "products": prod,
          }
        }));
    if (response.statusCode == 200) {
      print("Successfull");
    }
    print(response.statusCode);
    // if (response.statusCode != 204) {
    //   throw Exception('Failed to update place.');
    // }
  }

  Future<void> empityCart(Cart cart) async {
    final http.Response response = await httpClient.put(updateUrl,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          "data": {
            "products": [],
          }
        }));
    if (response.statusCode == 200) {
      print("Successfull");
    }
    print(response.statusCode);
    // if (response.statusCode != 204) {
    //   throw Exception('Failed to update place.');
    // }
  }
}
