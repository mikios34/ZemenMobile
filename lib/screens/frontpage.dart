import 'package:ecommerce/bloc/userBloc/userbloc.dart';
import 'package:ecommerce/bloc/userBloc/user_bloc.dart';
import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/screens/home_page.dart';
import 'package:ecommerce/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_social_ui/screens/home_screen.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  // _login(ctx) async {
  //   final UserEvent loginevent =
  //       UserLogin(User(email: "henockyeyoni@gmail.com", password: "094100"));
  //   //print("Workinfffffggggggggggggggggggggggggggggggggg");
  //   BlocProvider.of<UserBloc>(ctx).add(loginevent);
  //   print("Workinfffffggggggggggggggggggggggggggggggggg");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserOperationFailure) {
            //_showerrormessega();

            print("Nope");
          }
          if (state is UsersLoadSuccess) {
            Navigator.pushNamed(context, Homescreen.routeName);
            print("yess");
          }
        },
        builder: (context, state) {
          return _screen(context);
        },
      ),
    );
  }
}

Widget _screen(context) {
  return SingleChildScrollView(
    child: Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              ClipPath(
                clipper: MultipleRoundedCurveClipper(),
                child: Image(
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: double.infinity,
                  image: AssetImage('assets/images/restaurant4.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_bag_outlined),
                    Text("RERERrerererererer")
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Text(
            " ZEMEN ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              letterSpacing: 1,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            "Tap one of the foolowing buttons",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 13.0,
            ),
          ),
          SizedBox(height: 20.0),
          _loginform(context),
          SizedBox(height: 20.0),
          Text(
            "Powered By Vintage Technolgies",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 13.0,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _loginform(context) {
  final username = TextEditingController();
  final password = TextEditingController();
  _login(ctx) async {
    print(username.text);
    final UserEvent loginevent =
        await UserLogin(User(email: username.text, password: password.text));
    //print("Workinfffffggggggggggggggggggggggggggggggggg");
    BlocProvider.of<UserBloc>(ctx).add(loginevent);
    print("Workinfffffggggggggggggggggggggggggggggggggg");

    print("TETETETET");
  }

  return Form(
    child: Column(
      children: [
        //Icon(Icons.login, size: 180, color: Colors.white),
        Padding(
          padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
          child: TextField(
            controller: username,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15),
              hintText: "Email Or Phone Number",
              hintStyle: TextStyle(fontWeight: FontWeight.w300),
              border: OutlineInputBorder(
                  // borderSide: BorderSide(width: 0.1, color: Colors.black12),
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
          child: TextField(
            controller: password,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15),
              hintText: "Password",
              hintStyle: TextStyle(fontWeight: FontWeight.w300),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text("Remeber Me",
                      style: TextStyle(color: Colors.black87))),
              //Checkbox(value: false, onChanged: (){}),
              TextButton(
                  onPressed: () {},
                  child: Text("ForgotPassword",
                      style: TextStyle(color: Colors.black87)))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: FlatButton(
            minWidth: 250,
            disabledColor: Colors.white.withOpacity(0.5),
            splashColor: Colors.white,
            color: Colors.blueAccent.shade700,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onPressed:
                // _loggedin == true ? null :
                () => _login(context), //=> _login(context),
            child: Text(
              "Log In",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, SignUp.routeName);
          },
          child: Text(
            "Don't Have An Account? Sign Up Here",
            style: TextStyle(color: Colors.black87),
          ),
        ),
      ],
    ),
  );
}
