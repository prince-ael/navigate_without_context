import 'package:flutter/material.dart';
import './utils.dart';
import './route_names.dart';

class LoginScreen extends StatelessWidget {
  final currentFocus = FocusNode();
  final nextFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 120.0, 16.0, 0.0),
          child: Column(
            children: <Widget>[
              username(context, currentFocus, nextFocus),
              verticalSpace(16.0),
              password(nextFocus),
              verticalSpace(24.0),
              login(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget username(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    return TextField(
      autocorrect: false,
      enableSuggestions: false,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      focusNode: currentFocus,
      onSubmitted: (value) {
        currentFocus.unfocus();
        FocusScope.of(context).requestFocus(nextFocus);
      },
      decoration: InputDecoration(
        hintText: "Enter user name",
        labelText: "Username",
        contentPadding: EdgeInsets.all(12.0),
        labelStyle: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget password(FocusNode currentFocus) {
    return TextField(
      autocorrect: false,
      enableSuggestions: false,
      obscureText: true,
      focusNode: currentFocus,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(12.0),
        hintText: "Enter password",
        labelText: "Password",
        labelStyle: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget login(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ButtonTheme(
        height: 42.0,
        minWidth: 0.0,
        disabledColor: Color(0Xff012d76).withAlpha(102),
        child: FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.registrationScreen);
          },
          color: Color(0Xff012d76),
          child: Text(
            "Login",
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
