import 'package:ecommerce/models/models.dart';

import 'order.dart';

class User {
  final String? id;
  final String? username;
  final String? email;
  final String? password;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final List? cart;

  User(
      {this.id,
      this.phone,
      this.username,
      this.firstName,
      this.email,
      this.password,
      this.lastName,
      this.cart});

  @override
  // TODO: implement props
  List<Object?> get props => [email, username, password, firstName, lastName];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        //id: json["id"],
        email: json['email'],
        username: json['username'],
        //image: json['image'],
        password: json['password'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        phone: json['phoneNumber'],
        cart: json["cart"]
        //category: json['category'],
        );
  }
  String toString() =>
      'Post { firstName: $firstName, lastName:$lastName, email:$email, password:$password, username:$username}';
}
