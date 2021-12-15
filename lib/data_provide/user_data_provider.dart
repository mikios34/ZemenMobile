import 'dart:convert';
import 'package:ecommerce/models/models.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
//import 'package:flutter_tourist_helper/models/models.dart';
import 'package:http/http.dart' as http;
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserDataProvider {
  final secure_storage = new FlutterSecureStorage();
  final _baseUrl = 'http://192.168.43.84:3000';
  final http.Client httpClient;
  final url = "http://192.168.43.74:1337/api/auth/local/register";
  final loginurl = "http://192.168.43.74:1337/api/auth/local";
  // UserDataProvider() : assert(httpClient != null);
  UserDataProvider({required this.httpClient}) : assert(httpClient != null);

  Future<User> createUser(User user) async {
    print(user.email);
    final response = await httpClient.post(
      url,
      headers: <String, String>{'Content-Type': 'application/json'},
      body: json.encode({
        //'id': user.id,
        'email': user.email,
        'username': user.username,
        //'firstName': user.firstName,
        //'lastName': user.lastName,

        'password': user.password,

        //'phone': user.phone,
        //'isAdmin' : user.isAdmin,
      }),
    );
    print("yesssssssssssssssssssssssssssssssssss-------------------");
    if (response.statusCode == 200) {
      final output = jsonDecode(response.body);
      print("Workeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeed");
      print(output["user"]["id"]);
      final catresponse =
          await httpClient.post("http://192.168.43.74:1337/api/carts",
              headers: <String, String>{'Content-Type': 'application/json'},
              body: json.encode({
                //'id': user.id,
                "data": {
                  "users": {"id": output["user"]["id"]},
                  "products": []
                }
              }));
      final out = jsonDecode(catresponse.body);

      await secure_storage.write(key: 'token', value: output['jwt']);
      await secure_storage.write(
          key: 'id', value: output['user']["id"].toString());
      await secure_storage.write(
          key: 'username', value: output['user']["username"]);
      await secure_storage.write(key: 'cartid', value: out['data']["id"]);
      return User.fromJson(jsonDecode(response.body));
    } else {
      print(user.email);
      print(response.statusCode);
      print("nooooooooooooooooooooooooooooooooooooo");
      throw Exception('Failed to create place.');
    }
  }

  Future<User> loginUser(User user) async {
    print("############");
    print(user.email);
    final response = await httpClient.post(
      loginurl,
      headers: <String, String>{'Content-Type': 'application/json'},
      body: json.encode({
        //'id': user.id,
        'identifier': user.email,

        'password': user.password,

        //'phone': user.phone,
        //'isAdmin' : user.isAdmin,
      }),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      Map<String, dynamic> output = jsonDecode(response.body);

      final res = await httpClient.get(
          'http://192.168.43.74:1337/api/carts?filters[users][username][\$eq]=${output['user']["username"]}&populate=products&fields=id');

      final cat = jsonDecode(res.body);

      print("++++++++++++++++++++++++++++++++++++++++++++");
      print(cat["data"][0]["id"]);

      await secure_storage.write(key: 'token', value: output['jwt']);
      await secure_storage.write(
          key: 'id', value: output['user']["id"].toString());
      await secure_storage.write(
          key: 'username', value: output['user']["username"]);
      await secure_storage.write(
          key: 'cartid', value: cat["data"][0]["id"].toString());

      print(output);
      return User.fromJson(output);
    } else {
      print(user.email);
      print(response.statusCode);
      print("nooooooooooooooooooooooooooooooooooooo");
      throw Exception('Failed to create place.');
    }
  }

  Future<List<User>> getUser() async {
    final response = await httpClient.get('$_baseUrl/posts');

    if (response.statusCode == 200) {
      final users = jsonDecode(response.body) as List;
      return users.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }

  Future<void> deleteUser(User user) async {
    final http.Response response = await httpClient.delete(
      '$url/${user.username}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete place.');
    }
  }

  Future<void> updateUser(User user) async {
    final http.Response response = await httpClient.put(
      '$url/${user.username}',
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'id': user.username,
        'email': user.email,
        'password': user.firstName,
        'phone': user.lastName,
        'isAdmin': user.password,
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update place.');
    }
  }
}
