import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'bloc_auth/login/LoginBloc.dart';
import 'bloc_auth/screens/LoginPage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  runApp(
    Builder(
      builder: (context) => MyApp(
        loginBloc: LoginBloc(httpClient: http.Client(), context: context),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final LoginBloc loginBloc;

  MyApp({Key? key, required this.loginBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      home: BlocProvider<LoginBloc>(
        create: (context) => loginBloc,
        child: LoginPage(loginBloc: loginBloc),
      ),
    );
  }
}
