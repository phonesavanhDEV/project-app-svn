import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './auth/pages/login_page.dart';
import './auth/bloc_auth/login_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => LoginBloc(),
        child: LoginPage(),
      ),
    );
  }
}
