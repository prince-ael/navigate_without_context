import 'package:flutter/material.dart';
import 'locator.dart';
import 'navigation_service.dart';
import './route_names.dart';
import 'route_names.dart';

class LoginBloc with ChangeNotifier {
  String _userName;
  String _password;

  String _userIdErrorMessage;
  String _passwordErrorMessage;

  String get userIdErrorMessage => _userIdErrorMessage;
  String get passwordErrorMessage => _passwordErrorMessage;

  final NavigationService _navigationService = locator<NavigationService>();

  void onUserNameChanged(String value) {
    _userName = value;
    if (value != null && value.isNotEmpty) {
      _userIdErrorMessage = null;
      notifyListeners();
    }
  }

  void onPasswordhanged(String value) {
    _password = value;
    if (value != null && value.isNotEmpty) {
      _passwordErrorMessage = null;
      notifyListeners();
    }
  }

  void onLogin() {
    final bool isUserNameOk = _userName != null && _userName.isNotEmpty;
    final bool isPasswordOk = _password != null && _password.isNotEmpty;

    if (!isUserNameOk) {
      _userIdErrorMessage = "Cannot be empty";
      notifyListeners();
    } else if (!isPasswordOk) {
      _passwordErrorMessage = "Cannot be empty";
      notifyListeners();
    } else if (isUserNameOk && isPasswordOk) {
      _navigationService.navigateTo(RouteNames.registrationScreen);
    }
  }
}
