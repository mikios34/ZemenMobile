import 'package:ecommerce/bloc/userBloc/cart/cartBloc.dart';
import 'package:ecommerce/bloc/userBloc/order/orderBloc.dart';
import 'package:ecommerce/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  static const routeName = "/cart";
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double total = 136;

  _increment() {
    setState(() {
      total = 136;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      if (state is CartOperationFailure) {
        return Center(
          child: Text("Failed"),
        );
      }
      if (state is CartLoadSuccess) {
        print("Here We Go");
        print(state.cart[0].products);
        List pid = [];

        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 360,
              child: ListView(
                  children:
                      List.generate(state.cart[0].products!.length, (index) {
                total += double.parse(state
                    .cart[0].products![index]["attributes"]["price"]
                    .toString());
                pid.add({"id": state.cart[0].products![index]["id"]});
                print(pid);
                return _items(
                  title: state.cart[0].products![index]["attributes"]["title"],
                  price: state.cart[0].products![index]["attributes"]["price"],
                );
              })),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              //height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20,
                      offset: Offset(0, -15),
                      color: Color(0xFFDADADA).withOpacity(0.15))
                ],
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Color(0xFFF5F6F9),
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(Icons.receipt_outlined),
                        ),
                        Spacer(),
                        Text("Add Voucher code"),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(TextSpan(text: "Total:\n", children: [
                          TextSpan(
                              text: "\$${total.toString()}",
                              style: TextStyle(fontSize: 16))
                        ])),
                        SizedBox(
                          width: 190,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Colors.blueAccent.shade700,
                            onPressed: () =>
                                _makeOrder(products: state.cart[0].products!),
                            child: Text("Check Out",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      }
      // for (int i = 0; i > state.cart[0].products!.length;i++){

      // }

      return Center(child: Text("Loading"));
    });
  }

  Widget _items({required title, required price}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset("assets/images/pic3.jpg"),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Text.rich(TextSpan(
                  text: "\$$price",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.blueAccent.shade700)))
            ],
          )
        ],
      ),
    );
  }

  _makeOrder({required List products}) {
    List productsids = [];
    for (int i = 0; i < products.length; i++) {
      productsids.add({"id": products[i]["id"]});
    }
    OrderEvent event = MakeOrder(Order(
      products: productsids,
    ));
    BlocProvider.of<OrderBloc>(context).add(event);
    BlocProvider.of<CartBloc>(context).add(EmpityCart(Cart()));
  }
}
