import 'package:ecommerce/bloc/userBloc/userbloc.dart';
import 'package:ecommerce/models/models.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  static const routeName = '/signup';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phonenumberController = TextEditingController();
  _signUp(ctx) async {
    UserEvent signupevent = UserCreate(User(
        email: _emailController.text,
        username: _usernameController.text,
        //firstName: "Abebe",
        //lastName: "Alemu",
        //phone: _phonenumberController.text,
        password: _passwordController.text));

    BlocProvider.of<UserBloc>(ctx).add(signupevent);
  }

  GlobalKey<ScaffoldState> _scafoldState = GlobalKey<ScaffoldState>();
  bool _loggedin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scafoldState,
        backgroundColor: Colors.white.withOpacity(1),
        body: BlocConsumer<UserBloc, UserState>(
          builder: (context, state) {
            return _form(context);
          },
          listener: (context, state) {
            if (state is UserOperationFailure) {
              //_showerrormessega();

              print("Noooooooo");
            }
            if (state is UsersLoadSuccess) {
              //Navigator.pushNamed(context, Homescreen.routeName);
              print("yessssss");
            }
          },
        ));
  }

  Widget _form(ctx) {
    return Form(
      child: ListView(
        padding: EdgeInsets.only(top: 85),
        children: [
          Container(
              width: 60,
              height: 85,
              child: Image(
                  color: Colors.blueAccent.shade700,
                  image: AssetImage("assets/images/zemen-logo.png"))),

          Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 10),
            child: Center(
                child: Text(
              "Signup",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          // Icon(Icons.login_rounded,
          //     size: 180, color: Colors.blueAccent.shade700),
          Padding(
            padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
            child: TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15),
                hintText: "User Name",
                hintStyle: TextStyle(fontWeight: FontWeight.w300),
                border: OutlineInputBorder(
                    // borderSide: BorderSide(width: 0.1, color: Colors.black12),
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15),
                hintText: "Email",
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
              controller: _passwordController,
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
            padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
            child: TextField(
              controller: _phonenumberController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15),
                hintText: "Phone Number",
                hintStyle: TextStyle(fontWeight: FontWeight.w300),
                border: OutlineInputBorder(
                    // borderSide: BorderSide(width: 0.1, color: Colors.black12),
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(60, 10, 60, 0),
            child: FlatButton(
              splashColor: Colors.white,
              color: Colors.blueAccent.shade700,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () => _signUp(context),
              //  _loggedin == true
              //     ? null
              //     : () => _signup(context), // _login(),
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          FlatButton(
            splashColor: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Already Have An Account? Login",
              style: TextStyle(color: Colors.black38),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(60, 20, 60, 0),
            child: FlatButton(
              splashColor: Colors.white,
              color: Colors.lightBlue.shade900,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () {},
              //  _loggedin == true
              //     ? null
              //     : () => _signup(context), // _login(),
              child: Text(
                "Sign Up with Facebook",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
