import 'package:flutter/material.dart';
import 'package:svn_costing_profit/bloc_auth/screens/ChangePassword/ChangePasswordPage.dart';
import 'package:svn_costing_profit/bloc_auth/screens/RegisterScreen/RegisterPage.dart';
import 'package:svn_costing_profit/pages/CostAndProfitEvaluationPlan/CostProfit.dart';
import 'package:svn_costing_profit/pages/HomePage.dart';

import '../bloc_auth/login/LoginBloc.dart';
import '../bloc_auth/models/User.dart';
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

      case '/home':
        User user = settings.arguments as User;
        return MaterialPageRoute(
          builder: (_) => HomeScreen(user: user),
        );

      // return MaterialPageRoute(
      //   builder: (_) => Scaffold(
      //     body: Center(
      //       child: Text('Invalid user data'),
      //     ),
      //   ),
      // );

      case '/costprofit':
        return MaterialPageRoute(builder: (_) => CostProfit());

      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterPage());

      case '/changePassword':
        return MaterialPageRoute(builder: (_) => ChangePasswordPage());

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
