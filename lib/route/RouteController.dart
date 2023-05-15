import 'package:flutter/material.dart';
import 'package:svn_costing_profit/pages/CostAndProfitEvaluationPlan/CostProfit.dart';
import 'package:svn_costing_profit/pages/HomePage.dart';

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

      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case '/costprofit':
        return MaterialPageRoute(builder: (_) => CostProfit());

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
