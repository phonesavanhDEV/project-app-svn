import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc_auth/login_bloc.dart';

class LoginPage extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: BlocBuilder<LoginBloc, LoginState>(
  //       builder: (context, state) {
  //         return Container(
  //           decoration: BoxDecoration(
  //             image: DecorationImage(
  //               image: AssetImage('assets/images/image_screen.jpg'),
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //           child: Center(
  //             child: Container(
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.circular(10.0),
  //                 boxShadow: [
  //                   BoxShadow(
  //                     color: Colors.grey.withOpacity(0.5),
  //                     spreadRadius: 5,
  //                     blurRadius: 7,
  //                     offset: Offset(0, 3),
  //                   ),
  //                 ],
  //               ),
  //               width: 300,
  //               height: 300,
  //               child: Padding(
  //                 padding: EdgeInsets.all(16),
  //                 child: Form(
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       Container(
  //                         decoration: BoxDecoration(
  //                           color: Colors.white,
  //                           borderRadius: BorderRadius.circular(25),
  //                           boxShadow: [
  //                             BoxShadow(
  //                               color: Colors.grey.withOpacity(0.5),
  //                               spreadRadius: 2,
  //                               blurRadius: 5,
  //                               offset: Offset(0, 3),
  //                             ),
  //                           ],
  //                         ),
  //                         child: TextFormField(
  //                           controller: _emailController,
  //                           decoration: InputDecoration(
  //                             labelText: 'Email',
  //                             contentPadding: EdgeInsets.symmetric(
  //                                 horizontal: 16, vertical: 12),
  //                             border: InputBorder.none,
  //                           ),
  //                           keyboardType: TextInputType.emailAddress,
  //                         ),
  //                       ),
  //                       SizedBox(height: 16),
  //                       Container(
  //                         decoration: BoxDecoration(
  //                           color: Colors.white,
  //                           borderRadius: BorderRadius.circular(25),
  //                           boxShadow: [
  //                             BoxShadow(
  //                               color: Colors.grey.withOpacity(0.5),
  //                               spreadRadius: 2,
  //                               blurRadius: 5,
  //                               offset: Offset(0, 3),
  //                             ),
  //                           ],
  //                         ),
  //                         child: TextFormField(
  //                           controller: _passwordController,
  //                           decoration: InputDecoration(
  //                             labelText: 'Password',
  //                             contentPadding: EdgeInsets.symmetric(
  //                                 horizontal: 16, vertical: 12),
  //                             border: InputBorder.none,
  //                           ),
  //                           obscureText: true,
  //                         ),
  //                       ),
  //                       SizedBox(height: 16),
  //                       Container(
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(8),
  //                           boxShadow: [
  //                             BoxShadow(
  //                               color: Colors.grey.withOpacity(0.5),
  //                               spreadRadius: 2,
  //                               blurRadius: 5,
  //                               offset: Offset(0, 3),
  //                             ),
  //                           ],
  //                         ),
  //                         child: ElevatedButton(
  //                           child: Text('Login'),
  //                           onPressed: () {
  //                             BlocProvider.of<LoginBloc>(context).add(
  //                               LoginButtonPressed(
  //                                 username: _emailController.text,
  //                                 password: _passwordController.text,
  //                               ),
  //                             );
  //                           },
  //                           style: ElevatedButton.styleFrom(
  //                             primary: Colors.red,
  //                             padding: EdgeInsets.symmetric(
  //                                 horizontal: 16, vertical: 12),
  //                             shape: RoundedRectangleBorder(
  //                               borderRadius: BorderRadius.circular(8),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
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
                          onPressed: () {
                            BlocProvider.of<LoginBloc>(context).add(
                              LoginButtonPressed(
                                username: _emailController.text,
                                password: _passwordController.text,
                              ),
                            );
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
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     Text(
                    //       "It's your first time here?",
                    //       style: TextStyle(color: Colors.white),
                    //     ),
                    //     SizedBox(
                    //       width: 8,
                    //     ),
                    //     Text(
                    //       "Sign up",
                    //       style: TextStyle(
                    //           color: Color(0xfffe9721),
                    //           fontWeight: FontWeight.bold),
                    //     )
                    //   ],
                    // ),
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
}
