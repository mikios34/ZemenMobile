import 'dart:convert';

import 'package:ecommerce/models/models.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class OrderDataProvider {
  final secure_storage = new FlutterSecureStorage();
  final _baseUrl = 'http://192.168.43.84:3000';
  final http.Client httpClient;
  final url = "http://192.168.43.74:1337/api/orders";
  // OrderDataProvider() : assert(httpClient != null);
  OrderDataProvider({required this.httpClient}) : assert(httpClient != null);

  Future<void> makeOrder(Order order) async {
    print(order.products);
    final http.Response response = await httpClient.post(
      '$url',
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "data": {
          'users': {"id": 1},
          'products': order.products,
        }
      }),
    );
    if (response.statusCode == 200) {
      print("Successfull");
    }

    // if (response.statusCode != 204) {
    //   throw Exception('Failed to update place.');
    // }
  }
}
