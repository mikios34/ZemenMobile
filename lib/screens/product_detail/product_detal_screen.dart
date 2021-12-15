import 'dart:ui';

import 'package:ecommerce/bloc/userBloc/cart/cartBloc.dart';
import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetail extends StatelessWidget {
  static const routeName = '/detail';
  final ProductArgument args;
  ProductDetail({required this.args});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                      child: Image(
                        image: NetworkImage(this.args.product.image.toString()),
                        height: 250,
                        //width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: FlatButton(
                                padding: EdgeInsets.zero,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                onPressed: () {
                                  return Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: FlatButton(
                              padding: EdgeInsets.zero,
                              //color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 20,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  padding: EdgeInsets.only(top: 20.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          this.args.product.title.toString(),
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          width: 64,
                          decoration: BoxDecoration(
                              color: Color(0xFFF5F6f9),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("4.5"),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: Colors.yellow.shade800,
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 64),
                        child: Text(
                          this.args.product.description.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Text("See More Detail",
                                  style: TextStyle(
                                      color: Colors.red.shade700,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 12,
                                color: Colors.red.shade700,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.all(15),
              width: 120,
              decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.05),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Text.rich(TextSpan(
                  text: "Price:  ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                        text: "\$${this.args.product.price}",
                        style: TextStyle(color: Colors.redAccent.shade700))
                  ])),
            ),
          ),
          // Text.rich(TextSpan(
          //     text: "Price: ",
          //     style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          //     children: [
          //       TextSpan(
          //           text: "\$99.99",
          //           style: TextStyle(color: Colors.redAccent.shade700))
          //     ])),
          Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.only(top: 20.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.15,
                    right: MediaQuery.of(context).size.width * 0.15),
                child:
                    BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                  return FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.blueAccent.shade700,
                      onPressed: () =>
                          _cartUpdate(context, this.args.product.id),
                      child: Text("Add To Cart",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          )));
                }),
              ))
        ],
      ),
    );
  }

  _cartUpdate(ctx, prodid) async {
    CartEvent updateevent = CartUpdate(Cart(
      productid: prodid,
    ));

    BlocProvider.of<CartBloc>(ctx).add(updateevent);
    BlocProvider.of<CartBloc>(ctx).add(LoadUserCart(Cart(username: "sosi")));
  }
}
