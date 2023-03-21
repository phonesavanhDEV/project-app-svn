import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc_auth/login_bloc.dart';
import '../models/user_model.dart';
import '../repository/user_repository.dart';
import '../services/authentication_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late LoginBloc _loginBloc;
  late UserRepository userRepository;

  @override
  void initState() {
    super.initState();
    final dio = Dio();
    userRepository = UserRepository(apiService: ApiService(dio: dio));
    _loginBloc = LoginBloc(
      apiService: ApiService(dio: dio),
      currentUser: User(
        id: 0,
        username: '',
        password: '',
        email: '',
        token: '',
      ),
      userRepository: userRepository,
    );
  }

  @override
  void dispose() {
    _loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
          } else if (state is LoginSuccess) {
            Navigator.of(context).pop();
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                    ),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: state is LoginLoading
                        ? null
                        : () {
                            _loginBloc.add(LoginButtonPressed(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ));
                          },
                    child: state is LoginLoading
                        ? CircularProgressIndicator()
                        : Text("Login"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
