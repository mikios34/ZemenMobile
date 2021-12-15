import 'order.dart';

class Product {
  final String? id;
  final String? title;
  final double? price;
  final String? description;
  final String? image;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.image,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, price, description, image];

  factory Product.fromJson(Map<String, dynamic> json) {
    String url =
        json["attributes"]["image"]["data"][0]["attributes"]["url"].toString();
    String imageUrl = 'http://192.168.43.74:1337$url';
    return Product(
      id: json["id"].toString(),
      title: json["attributes"]["title"].toString(),
      price: 2,
      image: imageUrl,
      description: json["attributes"]["description"].toString(),
      //image: json['image'],
    );
  }
  String toString() =>
      'Post { id: $id,title: $title, price:$price, description:$description, image:$image}';
}
