import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/routes.dart';
import 'package:ecommerce/screens/product_detail/product_detal_screen.dart';
import 'package:flutter/material.dart';

class ProducCard extends StatefulWidget {
  List list;
  ProducCard({
    required this.list,
  });

  @override
  _ProducCardState createState() => _ProducCardState();
}

class _ProducCardState extends State<ProducCard> {
  final pics = [
    "assets/images/pic1.jpg",
    "assets/images/pic2.jpg",
    "assets/images/pic3.jpg",
    "assets/images/pic4.jpg",
    "assets/images/pic5.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    print("Here is the list");
    print(widget.list[0].image);
    return Container(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(widget.list.length, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetail.routeName,
                  arguments: ProductArgument(
                      product: Product(
                          id: widget.list[index].id,
                          title: widget.list[index].title,
                          description: widget.list[index].description,
                          image: widget.list[index].image,
                          price: widget.list[index].price)));
              print("navigate here");
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
              child: Container(
                height: 80,
                width: 90,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Color(0xFFF5F6F9),
                    blurRadius: 7,
                  )
                ]),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: Image(
                            height: 130,
                            image: NetworkImage(widget.list[index].image),
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Text(
                                widget.list[index].title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      '\$${widget.list[index].price}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 9),
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Container(
                                      padding: EdgeInsets.only(left: 2),
                                      height: 10,
                                      width: 20,
                                      color: Colors.red,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 6,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "4.9",
                                            style: TextStyle(
                                                fontSize: 8,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
