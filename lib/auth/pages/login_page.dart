import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/authentication_service.dart';
import '../bloc_auth/login_bloc.dart';

class LoginPage extends StatefulWidget {
  final AuthenticationService authenticationService;

  LoginPage({required Key key, required this.authenticationService})
      : assert(authenticationService != null),
        super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc(authenticationService: widget.authenticationService);
  }

  @override
  void dispose() {
    _loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginLoading) {
              return CircularProgressIndicator();
            } else if (state is LoginFailure) {
              return Text('Login failed: ${state.error}');
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    child: Text('Login'),
                    onPressed: state is LoginLoading
                        ? null
                        : () {
                            _loginBloc.add(LoginButtonPressed(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ));
                          },
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
