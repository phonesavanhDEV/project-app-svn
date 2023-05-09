import 'package:flutter/material.dart';

import '../bloc_auth/login/LoginBloc.dart';
import '../bloc_auth/screens/LoginScreen/LoginPage.dart';

class RouteController {
  final LoginBloc loginBloc;

  RouteController({required this.loginBloc});

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(
            builder: (_) => LoginPage(
                  loginBloc: loginBloc,
                ));
      // Add your other routes here
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
