import 'package:flutter/material.dart';
import 'package:ecommerce/data/data.dart';
import 'package:ecommerce/models/order.dart';

class Recentorders extends StatelessWidget {
  _recentorder(BuildContext context, String image) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.8),
                child: Image(
                  height: 100.0,
                  width: MediaQuery.of(context).size.width * 0.48,
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  final pics = [
    "assets/images/restaurant4.jpg",
    "assets/images/restaurant2.jpg",
    "assets/images/restaurant3.jpg",
    "assets/images/restaurant1.jpg",
    "assets/images/restaurant2.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
        child: Text(
          "Latest",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
      Container(
          height: 110.0,
          //color: Colors.blue,
          child: ListView(
            children: List.generate(pics.length, (index) {
              return _recentorder(context, pics[index]);
            }),
            scrollDirection: Axis.horizontal,
            // itemCount: currentUser.orders.length,
            // itemBuilder: (BuildContext context, int index) {
            //   Order order = currentUser.orders[index];
            //   return _recentorder(context, order);
            // }),
          ))
    ]);
  }
}
