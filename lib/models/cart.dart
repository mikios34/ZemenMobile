class Cart {
  final List? products;
  final String? username;
  final String? productid;

  Cart({this.productid, this.products, this.username});

  @override
  // TODO: implement props
  List<Object?> get props => [products];

  factory Cart.fromJson(Map<String, dynamic> json) {
    print("These are the attributes");
    print(json);
    return Cart(
      products: json["attributes"],
    );
  }
  String toString() => 'Post {products:$products}';
}
