import 'package:flutter/material.dart';

import './login_screen.dart';
import './registration_screen.dart';
import './route_names.dart';

class RouteConfig {
  Route routes(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.loginScreen:
        return loginScreen();
      case RouteNames.registrationScreen:
        return registrationScreen();
      default:
        return undefinedRoute(settings.name);
    }
  }

  MaterialPageRoute loginScreen() {
    return MaterialPageRoute(
      builder: (context) => LoginScreen(),
    );
  }
  // MaterialPageRoute loginScreen() {
  //   return MaterialPageRoute(
  //     builder: (context) => MultiProvider(
  //       providers: [ChangeNotifierProvider(create: (_) => LoginBloc())],
  //       child: LoginScreen(),
  //     ),
  //   );
  // }

  MaterialPageRoute registrationScreen() => MaterialPageRoute(
        builder: (context) => RegistrationScreen(),
      );
  // MaterialPageRoute registrationScreen() => MaterialPageRoute(
  //       builder: (context) => MultiProvider(
  //         providers: [
  //           ChangeNotifierProvider(create: (_) => RegistrationBloc())
  //         ],
  //         child: RegistrationScreen(),
  //       ),
  //     );

  MaterialPageRoute undefinedRoute(String routeName) => MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text("No Route Defined for $routeName"),
          ),
        ),
      );
}
