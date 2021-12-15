import 'package:ecommerce/models/models.dart';

class Category {
  //final String? id;
  final String? name;
  final List? products;

  Category({this.name, this.products});

  @override
  // TODO: implement props
  List<Object?> get props => [name, products];

  factory Category.fromJson(Map<String, dynamic> json) {
    print("These are the attributes");
    print(json);
    return Category(
      name: "json['name']",
      products: json["attributes"] as List<Product>,
    );
  }
  String toString() => 'Post { name: $name, products:$products}';
}
