import 'package:ecommerce/bloc/userBloc/cart/cartBloc.dart';
import 'package:ecommerce/bloc/userBloc/category/categoryBloc.dart';
import 'package:ecommerce/bloc/userBloc/userbloc.dart';
import 'package:ecommerce/bloc_observer.dart';
import 'package:ecommerce/repository/repository.dart';
import 'package:ecommerce/routes.dart';
import 'package:http/http.dart' as http;

import 'package:ecommerce/screens/frontpage.dart';
import 'package:ecommerce/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/userBloc/order/orderBloc.dart';
import 'bloc/userBloc/productsBloc/productbloc.dart';
import 'data_provide/data_provider.dart';
import 'models/models.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  final UserRepository userRepository = UserRepository(
    dataProvider: UserDataProvider(
      httpClient: http.Client(),
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //late UserRepository userRepository;
  final UserRepository userRepository = UserRepository(
    dataProvider: UserDataProvider(
      httpClient: http.Client(),
    ),
  );
  final ProductRepository productRepository = ProductRepository(
    dataProvider: ProductDataProvider(
      httpClient: http.Client(),
    ),
  );
  final CategoryRepository categoryRepository = CategoryRepository(
    dataProvider: CategoryDataProvider(
      httpClient: http.Client(),
    ),
  );
  final CartRepository cartRepository = CartRepository(
    dataProvider: CartDataProvider(
      httpClient: http.Client(),
    ),
  );
  final OrderRepository orderRepository = OrderRepository(
    dataProvider: OrderDataProvider(
      httpClient: http.Client(),
    ),
  );
  //sMyApp({required userRepository}) : assert(userRepository != null);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: this.userRepository),
          RepositoryProvider.value(value: this.productRepository),
          RepositoryProvider.value(value: this.categoryRepository),
          RepositoryProvider.value(value: this.cartRepository),
          RepositoryProvider.value(value: this.orderRepository)
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) =>
                      CartBloc(cartRepository: this.cartRepository)
                        ..add(LoadUserCart(Cart(username: "sosi")))),
              BlocProvider(
                  create: (context) =>
                      UserBloc(userRepository: this.userRepository)),
              BlocProvider(
                  create: (context) =>
                      ProductBloc(productRepository: this.productRepository)
                        ..add(ProductLoad())),
              BlocProvider(
                  create: (context) => CategoryBloc(
                      categoryRepository: this.categoryRepository)),
              BlocProvider(
                  create: (context) =>
                      OrderBloc(orderRepository: this.orderRepository)),
            ],
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              onGenerateRoute: AppRoute.generateRoute,
            )));
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     // This is the theme of your application.
    //     //
    //     // Try running your application with "flutter run". You'll see the
    //     // application has a blue toolbar. Then, without quitting the app, try
    //     // changing the primarySwatch below to Colors.green and then invoke
    //     // "hot reload" (press "r" in the console where you ran "flutter run",
    //     // or simply save your changes to "hot reload" in a Flutter IDE).
    //     // Notice that the counter didn't reset back to zero; the application
    //     // is not restarted.
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: FrontPage(),
    //   //MyHomePage(title: 'Flutter Demo Home Page'),
    // );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
