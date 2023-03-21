import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login/LoginBloc.dart';
import '../login/LoginEvent.dart';
import '../login/LoginState.dart';
import 'HomePage.dart';

// class LoginPage extends StatefulWidget {
//   final LoginBloc loginBloc;

//   const LoginPage({required this.loginBloc});

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocListener<LoginBloc, LoginState>(
//         listener: (context, state) {
//           if (state is LoginSuccess) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => HomePage(),
//               ),
//             );

//             // } else if (state is LoginFailure) {
//             //   // setState(() {
//             //   //   ScaffoldMessenger.of(context)
//             //   //     ..hideCurrentSnackBar()
//             //   //     ..showSnackBar(SnackBar(content: Text(state.error)));
//             //   // });
//             //   ScaffoldMessenger.of(context).showSnackBar(
//             //     SnackBar(
//             //       content: Text("Error: Login failed. Please try again."),
//             //       duration: Duration(seconds: 3),
//             //     ),
//             //   );
//             //   return;
//           }
//         },
//         child: BlocBuilder<LoginBloc, LoginState>(
//           builder: (context, state) {
//             return Center(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextField(
//                       controller: _emailController,
//                       decoration: InputDecoration(hintText: 'Email'),
//                     ),
//                     SizedBox(height: 10),
//                     TextField(
//                       controller: _passwordController,
//                       decoration: InputDecoration(hintText: 'Password'),
//                       obscureText: true,
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: state is LoginLoading
//                           ? null
//                           : () {
//                               widget.loginBloc.add(LoginButtonPressed(
//                                 email: _emailController.text,
//                                 password: _passwordController.text,
//                               ));
//                             },
//                       child: Text('Login'),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
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
                            // BlocProvider.of<LoginBloc>(context).add(
                            //   LoginButtonPressed(
                            //     email: _emailController.text,
                            //     password: _passwordController.text,
                            //   ),
                            // );
                            final loginBloc =
                                BlocProvider.of<LoginBloc>(context);
                            final email = _emailController.text;
                            final password = _passwordController.text;

                            // Dispatch the LoginButtonPressed event to the LoginBloc
                            loginBloc.add(LoginButtonPressed(
                                email: email, password: password));

                            final result = await loginBloc.stream
                                .firstWhere((state) => state is LoginSuccess);

                            if (result is LoginSuccess) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Login successful!"),
                                duration: Duration(seconds: 2),
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
}
