import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:svn_costing_profit/path/pathContact.dart';
import 'bloc_auth/login/LoginBloc.dart';

import 'bloc_auth/screens/LoginScreen/LoginPage.dart';
import 'network/CheckConnectedServer.dart';
import 'route/RouteController.dart';

void main() async {
  final pathContact contactPath = pathContact();
  WidgetsFlutterBinding.ensureInitialized();

  bool isServerConnected =
      await checkServerConnection(contactPath.getRepoPath());

  runApp(
    Builder(
      builder: (context) => MyApp(
        loginBloc: LoginBloc(httpClient: http.Client(), context: context),
        isServerConnected: isServerConnected,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final LoginBloc loginBloc;
  final bool isServerConnected;

  const MyApp(
      {Key? key, required this.loginBloc, required this.isServerConnected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RouteController routeController =
        RouteController(loginBloc: loginBloc);
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
            value: loginBloc), // Add loginBloc to MultiBlocProvider
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Login',
          onGenerateRoute: routeController
              .generateRoute, // Use singleton instance of RouteController
          home: isServerConnected
              ? LoginPage(loginBloc: loginBloc)
              : Scaffold(
                  body: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/background.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.warning_amber_outlined,
                              size: 80, color: Colors.yellow),
                          Text(
                            'ບໍ່ສາມາດເຊື່ອມຕໍ່ເຊີເວີ',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '(404)',
                            style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
    );
  }
}
