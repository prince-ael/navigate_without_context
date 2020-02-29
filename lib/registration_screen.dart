import 'package:flutter/material.dart';
import './utils.dart';

class RegistrationScreen extends StatelessWidget {
  final customerIdNode = FocusNode();
  final accountNumberNode = FocusNode();
  final mobileNumberNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 0.0),
          child: Column(
            children: <Widget>[
              customerId(context),
              verticalSpace(16.0),
              accountNumber(context),
              verticalSpace(16.0),
              mobileNumber(context),
              verticalSpace(76.0),
              Row(
                children: <Widget>[
                  backButton(context),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customerId(BuildContext context) {
    return TextField(
      autocorrect: false,
      enableSuggestions: false,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      focusNode: customerIdNode,
      onSubmitted: (value) {
        customerIdNode.unfocus();
        FocusScope.of(context).requestFocus(accountNumberNode);
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

  Widget accountNumber(BuildContext context) {
    return TextField(
      autocorrect: false,
      enableSuggestions: false,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      focusNode: accountNumberNode,
      onSubmitted: (value) {
        accountNumberNode.unfocus();
        FocusScope.of(context).requestFocus(mobileNumberNode);
      },
      decoration: InputDecoration(
        hintText: "Enter account no.",
        labelText: "Account No.",
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

  Widget mobileNumber(BuildContext context) {
    return TextField(
      autocorrect: false,
      enableSuggestions: false,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.done,
      focusNode: mobileNumberNode,
      decoration: InputDecoration(
        hintText: "Enter mobile no.",
        labelText: "Mobile No,",
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

  Widget backButton(BuildContext context) {
    return ButtonTheme(
      height: 42,
      minWidth: 42,
      child: FlatButton(
        shape: OutlineInputBorder(
          borderSide: BorderSide(width: 1.0, color: Colors.blue),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.blue,
        ),
      ),
    );
  }
}
