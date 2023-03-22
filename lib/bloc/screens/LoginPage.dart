import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login/LoginBloc.dart';
import '../login/LoginEvent.dart';
import '../login/LoginState.dart';
import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  final LoginBloc loginBloc;

  const LoginPage({required this.loginBloc});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        key: _formKey,
        builder: (context, state) {
          return Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/image_screen.jpg'),
                        fit: BoxFit.cover)),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Color(0xff161d27).withOpacity(0.9),
                  Color(0xff161d27),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "ສະບາຍດີ!",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'NotoSansLao',
                          fontSize: 38,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "ຮ້ານ minismall ຍີນດີໃຫ້ບໍລິການ",
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontFamily: 'NotoSansLao',
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 40, right: 40),
                      child: TextField(
                        controller: _emailController,
                        style: TextStyle(fontSize: 14, color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "ອີເມວ",
                          hintStyle: TextStyle(
                            color: Colors.grey.shade700,
                            fontFamily: 'NotoSansLao',
                          ),
                          filled: true,
                          fillColor: Color(0xff161d27).withOpacity(0.9),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Color(0xfffe9721))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Color(0xfffe9721))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 40, right: 40),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        style: TextStyle(fontSize: 14, color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "ລະຫັດຜ່ານ",
                          hintStyle: TextStyle(
                            color: Colors.grey.shade700,
                            fontFamily: 'NotoSansLao',
                          ),
                          filled: true,
                          fillColor: Color(0xff161d27).withOpacity(0.9),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Color(0xfffe9721))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Color(0xfffe9721))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    // Text(
                    //   "Forgot Password?",
                    //   style: TextStyle(
                    //       color: Color(0xfffe9721),
                    //       fontSize: 14,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 50,
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 40, right: 40),
                        child: ElevatedButton(
                          onPressed: () async {
                            // Show the loading dialog
                            showLoadingDialog(context);

                            final loginBloc =
                                BlocProvider.of<LoginBloc>(context);
                            final email = _emailController.text;
                            final password = _passwordController.text;

                            // Dispatch the LoginButtonPressed event to the LoginBloc
                            loginBloc.add(LoginButtonPressed(
                                email: email, password: password));

                            final result = await loginBloc.stream.firstWhere(
                                (state) =>
                                    state is LoginSuccess ||
                                    state is LoginFailure);

                            if (result is LoginSuccess) {
                              Navigator.pop(context);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                              );
                            } else if (result is LoginFailure) {
                              Navigator.pop(context);

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Invalid email or password"),
                              ));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xfffe9721),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 16,
                    ),

                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Dialog(
            child: Container(
              height: 80,
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    strokeWidth: 4,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),
                  ),
                  SizedBox(width: 16),
                  Text('ກຳລັງໂຫລດ...',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
