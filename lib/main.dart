import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'bloc_auth/login/LoginBloc.dart';
import 'bloc_auth/screens/LoginPage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'network/CheckConnectedServer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool isServerConnected =
      await checkServerConnection('https://souvanny.la/costing/conn');

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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login',
        home: isServerConnected
            ? BlocProvider<LoginBloc>(
                create: (context) => loginBloc,
                child: LoginPage(loginBloc: loginBloc),
              )
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
              ));
  }
}
