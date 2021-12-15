import 'package:ecommerce/bloc/userBloc/category/categoryBloc.dart';
import 'package:ecommerce/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  _load(ctx) {
    // BlocProvider.of<CategoryBloc>(ctx)
    //     .add(ProductLoadByCategory(Category(name: "test")));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc, CategoryState>(
      listener: (context, state) {
        if (state is CategoryOperationFailure) {
          //_showerrormessega();

          print("Nope");
        }
        if (state is CategoryLoadSuccess) {
          print(state.category);
          // /Navigator.pushNamed(context, Homescreen.routeName);
          print("yess");
        }
      },
      builder: (context, state) {
        return Container(
          child: Center(
            child: TextButton(
              child: Text("Load"),
              onPressed: () => _load(context),
            ),
          ),
        );
        //return Center(child: CircularProgressIndicator());
      },
    );
  }
}
