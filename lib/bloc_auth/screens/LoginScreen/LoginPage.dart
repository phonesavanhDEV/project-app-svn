import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../contact/HaxColors.dart';
import '../../../network/CheckNetwork.dart';
import '../../../pages/HomePage.dart';
import '../../login/LoginBloc.dart';
import '../../login/LoginEvent.dart';
import '../../login/LoginState.dart';
import '../RegisterScreen/RegisterPage.dart';
import 'FormShowDialog.dart';

class LoginPage extends StatefulWidget {
  final LoginBloc loginBloc;

  const LoginPage({required this.loginBloc});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  final InternetConnectivity internetConnectivity = InternetConnectivity();

  @override
  void initState() {
    super.initState();
    internetConnectivity.startMonitoringConnectivity((isConnected) {
      if (!isConnected) {
        FormShowDialog.showAlertDialog(
            context, 'ຂໍອະໄພ! ມີບັນຫາໃນການເຊື່ອມຕໍ່');
      }
    });
  }

  @override
  void dispose() {
    internetConnectivity.stopMonitoringConnectivity();
    super.dispose();
  }

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
                        image: AssetImage('assets/images/screen_n_login.jpg'),
                        fit: BoxFit.cover)),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.transparent,
                  Colors.transparent,
                  HaxColor.colorDark.withOpacity(0.9),
                  HaxColor.colorDark,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "SouvannyCosting",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'NotoSansLao',
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "ສຸວັນນີ souvanny",
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
                        controller: _userController,
                        style: TextStyle(fontSize: 14, color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "ໄອດີ",
                          hintStyle: TextStyle(
                            color: Colors.grey.shade700,
                            fontFamily: 'NotoSansLao',
                          ),
                          filled: true,
                          fillColor: Color(0xff161d27).withOpacity(0.9),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: HaxColor.colorOrange)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: HaxColor.colorOrange)),
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
                        obscureText: _obscureText,
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
                            borderSide: BorderSide(color: HaxColor.colorOrange),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: HaxColor.colorOrange),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey.shade700,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 35.0),
                          child: TextButton(
                            onPressed: () {
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   SnackBar(
                              //     content: Text('coming soon'),
                              //     backgroundColor: Colors.green,
                              //   ),
                              // );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterPage(),
                                ),
                              );
                            },
                            child: Text(
                              'ສ້າງບັນຊີໃໝ່', //Create a new account
                              style: TextStyle(
                                color: HaxColor.colorOrange,
                                fontFamily: 'NotoSansLao',
                                //fontWeight: FontWeight.bold,
                                //fontStyle: FontStyle.italic,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        height: 50,
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 40, right: 40),
                        child: ElevatedButton(
                          onPressed: () async {
                            // Show the loading dialog

                            final internetConnectivity = InternetConnectivity();
                            bool isConnected = await internetConnectivity
                                .checkInternetConnectivity();
                            if (!isConnected) {
                              FormShowDialog.showAlertDialog(
                                  context, 'ຂໍອະໄພ! ມີບັນຫາໃນການເຊື່ອມຕໍ່');
                              return;
                            }

                            FormShowDialog.showLoadingDialog(context);

                            final loginBloc =
                                BlocProvider.of<LoginBloc>(context);
                            final username = _userController.text;
                            final userpassword = _passwordController.text;

                            // Dispatch the LoginButtonPressed event to the LoginBloc
                            loginBloc.add(LoginButtonPressed(
                                username: username,
                                userpassword: userpassword));

                            final result = await loginBloc.stream.firstWhere(
                                (state) =>
                                    state is LoginSuccess ||
                                    state is LoginFailure);

                            if (result is LoginSuccess) {
                              Navigator.pop(context);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            } else if (result is LoginFailure) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'ກະລຸນາກວດຊື່ໄອດີແລະລະຫັດຜ່ານຄືນໃໝ່'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: HaxColor.colorOrange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            "ເຂົ້າສູ່ລະບົບ", //LOGIN
                            style: TextStyle(
                              fontFamily: 'NotoSansLao',
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
