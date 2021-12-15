import 'package:ecommerce/bloc/userBloc/category/categoryBloc.dart';
import 'package:ecommerce/bloc/userBloc/productsBloc/productbloc.dart';
import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/routes.dart';
import 'package:ecommerce/screens/categories_screen/category_screen.dart';
import 'package:ecommerce/widges/ProductCard.dart';
import 'package:ecommerce/widges/loading_page.dart';
import 'package:ecommerce/widges/recent_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final icons = [
    'assets/images/apparel.png',
    'assets/images/beauty.png',
    'assets/images/shoes.png',
    'assets/images/apparel.png',
    'assets/images/beauty.png',
    'assets/images/seeall.png',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 3),
          child: Text(
            "Categories",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: Colors.black87),
          ),
        ),
        new Container(
          height: 80.0,
          child: new ListView(
            scrollDirection: Axis.horizontal,
            children: new List.generate(6, (int index) {
              return new GestureDetector(
                //child: Icon(Icons.ac_unit),

                child: ClipRRect(
                  child: Image(
                    width: 60,

                    //fit: BoxFit.fitWidth,
                    alignment: Alignment.centerRight,
                    image: AssetImage(icons[index]),
                  ),
                ),
                onTap: () {
                  int id = index + 1;

                  ProductEvent signupevent =
                      ProductLoadByCategory(Product(title: "2"));

                  BlocProvider.of<ProductBloc>(context).add(signupevent);
                  Navigator.of(context).pushNamed(CategoryScreen.routeName,
                      arguments: CategoryArgument(id: id));
                },
              );
            }),
          ),
        ),
        Recentorders(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //LatestProduct(),
            Padding(
              padding: EdgeInsets.only(
                left: 20.0,
              ),
              child: Text(
                "Latest",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductOperationFailure) {
                  print("failed");
                  return Center(
                    child: Column(
                      children: [
                        FlatButton(
                          child: Row(
                            children: [
                              Icon(
                                Icons.refresh,
                                color: Colors.black,
                              ),
                              Text(
                                "Refresh",
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black),
                              )
                            ],
                          ),
                          onPressed: () {
                            BlocProvider.of<ProductBloc>(context)
                                .add(ProductLoad());
                            //return Center(child: CircularProgressIndicator());
                            //CircularProgressIndicator();
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 200),
                          child: Text(
                            'Network Error Try Refresh',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                if (state is ProductLoadSuccess) {
                  print(
                      '---------------------fas-dfas-dfa-sd-f-------------fasd-fa-sdf-asd-fas--------');
                  final places = state.product;
                  print(places);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProducCard(
                          list: places.sublist(0, places.length ~/ 2.toInt())),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20.0,
                        ),
                        child: Text(
                          "Latest",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      ProducCard(
                        list: places.sublist(
                            places.length ~/ 2.toInt(), places.length),
                      ),
                    ],
                  );
                  //ListView.builder(
                  //   itemCount: places.length,
                  //   itemBuilder: (_, idx) => Card(
                  //     child: makeCards(places, idx, context),
                  //   ),
                  //   // Card(
                  //   //   child: Column(
                  //   //     children: [
                  //   //       Image(

                  //   //         image: NetworkImage('${places[idx].image}'),
                  //   //       ),
                  //   //       Text('${places[idx].title}')

                  //   //     ],
                  //   //   ),
                  //   // )
                  //   //   ListTile(

                  //   //     title: Text('${places[idx].title}'),
                  //   //     subtitle: Text('Testing'),
                  //   //     //subtitle: Text('${places[idx].description}'),
                  //   //   //   onTap: () => Navigator.of(context)
                  //   //   //       .pushNamed(CourseDetail.routeName, arguments: courses[idx]),
                  //   //   // ),
                  //   //   )
                  // );
                }
                return Column(
                  children: [
                    LoadingCard(),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.0,
                      ),
                      child: Text(
                        "Latest",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    LoadingCard()
                  ],
                );
                //return Center(child: CircularProgressIndicator());
              },
            ),

            // Padding(
            //   padding: EdgeInsets.only(
            //     left: 20.0,
            //   ),
            //   child: Text(
            //     "Latest",
            //     style: TextStyle(
            //       fontSize: 20.0,
            //       fontWeight: FontWeight.bold,
            //       letterSpacing: 1.2,
            //     ),
            //   ),
            // ),
            // //ProducCard(),
            //_nearbyrestaurants(),
          ],
        ),
      ],
    );
  }
}
