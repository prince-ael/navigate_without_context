import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String name) {
    return navigatorKey.currentState.popAndPushNamed(name);
  }

  bool goBack() {
    bool isGoingBack = navigatorKey.currentState.pop();
    print("isGoingBack: $isGoingBack");
    return isGoingBack;
  }
}
