import 'dart:ui';

import 'package:ecommerce/bloc/userBloc/productsBloc/productbloc.dart';
import 'package:ecommerce/routes.dart';
import 'package:ecommerce/screens/bottom_navbar_screens/buttomnavbarpages.dart';
import 'package:ecommerce/widges/ProductCard.dart';
import 'package:ecommerce/widges/latest_Product.dart';
import 'package:ecommerce/widges/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ecommerce/data/data.dart';
import 'package:ecommerce/models/restaurant.dart';
import 'package:ecommerce/screens/restauran_screen.dart';
import 'package:ecommerce/widges/recent_order.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'categories_screen/category_screen.dart';

class Homescreen extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  _nearbyrestaurants() {
    List<Widget> restaurantlist = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantlist.add(
        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => RestaurantScreen(restaurant: restaurant))),
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 2.0,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image(
                    height: 100.0,
                    width: 120.0,
                    image: AssetImage(restaurant.imageUrl),
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          restaurant.name,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          restaurant.address + "hfhasdgfagsdfjhajshdfjag",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          restaurant.rating.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
    return Column(
      children: restaurantlist,
    );
  }

  int _currentindex = 0;
  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    CartPage(),
    ProfilePage(),
    ProfilePage(),
    //CategoryScreen()
  ];

  Widget _menuItem({required IconData icon, required String text}) {
    final color = Colors.white;
    final hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.symmetric(horizontal: 20);
    return Scaffold(
      drawer: Drawer(
          child: Material(
        color: Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          padding: padding,
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/images/restaurant4.jpg"),
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Micky",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    Text("haylemikaeltefera@gmail.com",
                        style: TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.w300,
                            fontSize: 15)),
                  ],
                )
              ],
            ),
            SizedBox(height: 30),
            Divider(color: Colors.white70),
            SizedBox(
              height: 20,
            ),
            _menuItem(icon: Icons.person, text: "Profile"),
            _menuItem(icon: Icons.category, text: "Categories"),
            _menuItem(icon: Icons.shopping_cart, text: "Cart"),
            _menuItem(icon: Icons.settings_input_component, text: "Orders"),
            SizedBox(height: 20),
            Divider(color: Colors.white70),
            SizedBox(
              height: 20,
            ),
            _menuItem(icon: Icons.contact_page, text: "About Us"),
            _menuItem(icon: Icons.logout, text: "Logout"),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text("Powered By Vintage Technologies.",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    color: Colors.white70,
                  )),
            ),
          ],
        ),
      )
          // Column(
          //   children: [
          //     Container(
          //       //color: Colors.grey.shade300,
          //       height: 150,
          //       width: 320,
          //       decoration:
          //           BoxDecoration(color: Colors.grey.shade200, boxShadow: [
          //         BoxShadow(
          //           color: Colors.grey.shade600,
          //           blurRadius: 8,
          //         )
          //       ]),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Image(
          //             color: Colors.blueAccent.shade700,
          //             height: 90,
          //             image: AssetImage("assets/images/zemen-logo.png"),
          //           ),
          //         ],
          //       ),
          //     ),
          //     // AppBar(

          //     //   automaticallyImplyLeading:
          //     //       false, // this will hide Drawer hamburger icon

          //     //   backgroundColor: Colors.white.withOpacity(0.7),
          //     //   title: Center(
          //     //     child: Image(
          //     //       height: 60,
          //     //       image: AssetImage("assets/images/zemen-logo.png"),
          //     //     ),
          //     //   ),
          //     // )
          //   ],
          // ),
          ),
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.green),
        backgroundColor: Colors.white.withOpacity(0.7),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(60, 0, 50, 0),
            child: Image(
              color: Colors.blueAccent.shade700,
              image: AssetImage("assets/images/zemen-logo.png"),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Icon(
              Icons.shopping_basket_outlined,
              color: Colors.black87,
            ),
          )
        ],
      ),
      body: _pages[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        unselectedItemColor: Colors.black87,
        selectedItemColor: Colors.blue.shade600,
        showUnselectedLabels: true,
        currentIndex: _currentindex,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w800),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.black87,
            ),
            label: "Home",
            activeIcon: Icon(Icons.home_outlined, color: Colors.blue.shade600),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black87,
              ),
              activeIcon: Icon(Icons.search, color: Colors.blue.shade600),
              label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black87,
              ),
              activeIcon: Icon(Icons.shopping_cart_outlined,
                  color: Colors.blue.shade600),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_box_outlined,
                color: Colors.black87,
              ),
              activeIcon:
                  Icon(Icons.account_box_outlined, color: Colors.blue.shade600),
              label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.more_vert_outlined,
                color: Colors.black87,
              ),
              activeIcon:
                  Icon(Icons.more_vert_outlined, color: Colors.blue.shade600),
              label: "More"),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
    );
  }

  final id = [1, 2, 3, 4, 5];

  Widget _body(ctx) {
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
                  Navigator.of(context).pushNamed(CategoryScreen.routeName,
                      arguments: CategoryArgument(id: index));
                },
              );
            }),
          ),
        ),
        //Recentorders(),
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

                  return ProducCard(list: ["gf", "fd"]);
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
                return LoadingCard();
                //return Center(child: CircularProgressIndicator());
              },
            ),

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
            //ProducCard(),
            //_nearbyrestaurants(),
          ],
        ),
      ],
    );
  }
}
