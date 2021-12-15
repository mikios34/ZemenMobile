import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/screens/bottom_navbar_screens/cart_page.dart';
import 'package:ecommerce/screens/categories_screen/category_screen.dart';
import 'package:ecommerce/screens/frontpage.dart';
import 'package:ecommerce/screens/home_page.dart';
import 'package:ecommerce/screens/product_detail/product_detal_screen.dart';
import 'package:ecommerce/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppRoute {
  static Route generateRoute(RouteSettings settings) {
    // if (settings.name == '/') {
    //   return MaterialPageRoute(builder: (context) => PlacesList() );
    // }

    // if (settings.name == AddPlace.routeName) {
    //   PlaceArgument args = settings.arguments;
    //   return MaterialPageRoute(
    //       builder: (context) => AddPlace(
    //             args: args,
    //           ));
    // }
    // if (settings.name == UpdatePlace.routeName) {
    //   PlaceArgument args = settings.arguments;
    //   return MaterialPageRoute(
    //       builder: (context) => UpdatePlace(
    //             args: args,
    //           ));
    // }

    if (settings.name == CategoryScreen.routeName) {
      CategoryArgument course = settings.arguments as CategoryArgument;
      return MaterialPageRoute(
          builder: (context) => CategoryScreen(
                args: course,
              ));
    }
    if (settings.name == SignUp.routeName) {
      // UserArgument? user = settings.arguments;
      return MaterialPageRoute(builder: (context) => SignUp());
    }
    if (settings.name == Homescreen.routeName) {
      // UserArgument? user = settings.arguments;
      return MaterialPageRoute(builder: (context) => Homescreen());
    }

    if (settings.name == ProductDetail.routeName) {
      ProductArgument product = settings.arguments as ProductArgument;
      return MaterialPageRoute(
          builder: (context) => ProductDetail(args: product));
    }
    if (settings.name == CartPage.routeName) {
      // UserArgument? user = settings.arguments;
      return MaterialPageRoute(builder: (context) => CartPage());
    }
    // if (settings.name == PlacesList.routeName) {
    //   //User user = settings.arguments;
    //   return MaterialPageRoute(
    //     builder: (context)=> PlacesList()
    //   );

    // }
    return MaterialPageRoute(builder: (context) => FrontPage());

    //return MaterialPageRoute(builder: (context) => Homescreen());
  }
}

// class PlaceArgument {
//   final Place place;
//   final bool edit;
//   PlaceArgument({this.place, this.edit});
// }
class CategoryArgument {
  //late final Product product;
  //late final bool edit;
  late final int id;
  // CategoryArgument({required this.product, required this.edit});
  CategoryArgument({required this.id});
}

class ProductArgument {
  final Product product;
  ProductArgument({required this.product});
}

class CartArgument {
  final Product product;
  CartArgument({required this.product});
}

class UserArgument {
  final User user;
  final bool edit;
  UserArgument({required this.user, required this.edit});
}
