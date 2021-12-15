import 'package:ecommerce/bloc/userBloc/cart/cartBloc.dart';
import 'package:ecommerce/bloc/userBloc/category/categoryBloc.dart';
import 'package:ecommerce/bloc/userBloc/productsBloc/productbloc.dart';
import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/routes.dart';
import 'package:ecommerce/screens/product_detail/product_detal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CategoryScreen extends StatefulWidget {
  static const routeName = '/CategoryProduct';
  late final CategoryArgument args;
  CategoryScreen({required this.args});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    print("NIININININI");
  }

  _loadbyCategory(ctx) {
    CategoryEvent signupevent = LoadProductByCategory(Category(name: "2"));

    BlocProvider.of<CategoryBloc>(ctx).add(signupevent);
  }

  List products = [
    "assets/images/restaurant1.jpg",
    "assets/images/restaurant2.jpg",
    "assets/images/restaurant3.jpg",
    "assets/images/restaurant4.jpg",
    "assets/images/pic1.jpg",
    "assets/images/pic2.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    print(widget.args.id);
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<ProductBloc>(context).add(ProductLoad());
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black87),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Category",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 25),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.shopping_cart),
            )
          ],
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductOperationFailure) {
              return Text("Failed");
            }
            if (state is ProductLoadSuccess) {
              print("Yes Working Hereeeeeeeeeeeeeeeeeeeeeeee");
              print(state.product);
              return GridView.count(
                  addRepaintBoundaries: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 4.0,
                  padding: EdgeInsets.all(10),
                  childAspectRatio: .85,
                  children: state.product.map((e) {
                    return _card(
                        ctx: context,
                        product: Product(
                          id: e.id,
                          title: e.title,
                          price: e.price,
                          description: e.description,
                          image: e.image,
                        ));
                  }).toList());
            }
            return GridView.count(
                addRepaintBoundaries: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 4.0,
                padding: EdgeInsets.all(10),
                childAspectRatio: .85,
                children: products.map((e) {
                  return _shimmercard();
                }).toList());
          },
        ),
      ),
    );
    // BlocBuilder<ProductBloc, ProductState>(
    //   builder: (context, state) {
    //     if (state is ProductOperationFailure) {
    //       print("failed");
    //       return Container(
    //         child: TextButton(
    //           child: Text("Failed"),
    //           onPressed: () => _loadbyCategory(context),
    //         ),
    //       );
    //     }
    //     if (state is ProductLoadSuccess) {
    //       print(
    //           '---------------------fas-dfas-dfa-sd-f-------------fasd-fa-sdf-asd-fas--------');
    //       final places = state.product;
    //       print(places);
    //       return Container(
    //         child: TextButton(
    //           child: Text("TST"),
    //           onPressed: () => _loadbyCategory(context),
    //         ),
    //       );
    //     }
    //     return Container(
    //       child: Text("TST"),
    //     );
    //   },
    // );
  }

  Widget _card({ctx, required Product product}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetail.routeName,
            arguments: ProductArgument(
                product: Product(
                    title: product.title,
                    description: product.description,
                    price: product.price,
                    image: product.image)));
      },
      child: Card(
        color: Colors.white,
        shadowColor: Colors.red.shade700,
        elevation: 8,
        borderOnForeground: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 5),
              child: Container(
                height: 100,
                child: Image(
                  image: NetworkImage(product.image.toString()),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  product.title.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      fontSize: 15),
                ),
                Text(
                  "Addidas",
                  style: TextStyle(
                      fontWeight: FontWeight.w200,
                      letterSpacing: 1.2,
                      fontSize: 12),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.price}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  IconButton(
                      onPressed: () => _cartUpdate(context, product.id),
                      icon: Icon(
                        Icons.add_shopping_cart,
                        size: 16,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _shimmercard() {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Card());
  }

  _cartUpdate(ctx, prodid) async {
    CartEvent updateevent = CartUpdate(Cart(
      productid: prodid,
    ));

    BlocProvider.of<CartBloc>(ctx).add(updateevent);
    BlocProvider.of<CartBloc>(ctx).add(LoadUserCart(Cart(username: "sosi")));
  }
}
