class Order {
  final List? products;
  final String? id;

  Order({
    this.products,
    this.id,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [products];

  factory Order.fromJson(Map<String, dynamic> json) {
    print("These are the attributes");
    print(json);
    return Order(
      products: json["attributes"],
    );
  }
  String toString() => 'Post {products:$products}';
}
