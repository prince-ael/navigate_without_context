import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:navigate_without_context/login_bloc.dart';
import './utils.dart';

class LoginScreen extends StatelessWidget {
  final currentFocus = FocusNode();
  final nextFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    final loginBloc = Provider.of<LoginBloc>(context, listen: false);
    return WillPopScope(
      onWillPop: null,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.0, 120.0, 16.0, 0.0),
            child: Column(
              children: <Widget>[
                username(context, currentFocus, nextFocus, loginBloc),
                verticalSpace(16.0),
                password(nextFocus, loginBloc),
                verticalSpace(24.0),
                login(context, loginBloc),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget username(BuildContext context, FocusNode currentFocus,
      FocusNode nextFocus, LoginBloc loginBloc) {
    return Selector<LoginBloc, String>(
      selector: (ctx, bloc) => bloc.userIdErrorMessage,
      builder: (ctx, errorMsg, child) {
        return TextField(
          autocorrect: false,
          enableSuggestions: false,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.next,
          focusNode: currentFocus,
          onChanged: loginBloc.onUserNameChanged,
          onSubmitted: (value) {
            currentFocus.unfocus();
            FocusScope.of(context).requestFocus(nextFocus);
          },
          decoration: InputDecoration(
            hintText: "Enter user name",
            labelText: "Username",
            contentPadding: EdgeInsets.all(12.0),
            errorText: errorMsg,
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
      },
    );
  }

  Widget password(FocusNode currentFocus, LoginBloc loginBloc) {
    return Selector<LoginBloc, String>(
      selector: (_, bloc) => bloc.passwordErrorMessage,
      builder: (ctx, errorMsg, child) {
        return TextField(
          autocorrect: false,
          enableSuggestions: false,
          obscureText: true,
          focusNode: currentFocus,
          onChanged: loginBloc.onPasswordhanged,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(12.0),
            hintText: "Enter password",
            labelText: "Password",
            errorText: errorMsg,
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
      },
    );
  }

  Widget login(BuildContext context, LoginBloc bloc) {
    return SizedBox(
      width: double.infinity,
      child: ButtonTheme(
        height: 42.0,
        minWidth: 0.0,
        disabledColor: Color(0Xff012d76).withAlpha(102),
        child: FlatButton(
          onPressed: bloc.onLogin,
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
