import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../contact/HaxColors.dart';
import '../../../network/CheckNetwork.dart';

import '../../register/RegisterCubit.dart';
import '../../widgets/CustomAppBar.dart';
import '../LoginScreen/FormShowDialog.dart';

import 'AlertRegister.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _employeecodeController = TextEditingController();
  final _namefullController = TextEditingController();

  bool _obscureText = true;
  bool _obscureText2 = true;
  String _passwordStrength = '';

  final InternetConnectivity internetConnectivity = InternetConnectivity();

  void _updatePasswordStrength(String password) {
    setState(() {
      if (password.length >= 8 &&
          password.contains(new RegExp(r'[A-Z]')) &&
          password.contains(new RegExp(r'[a-z]')) &&
          password.contains(new RegExp(r'[0-9]')) &&
          password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        _passwordStrength = 'strong';
      } else if (password.length >= 6 &&
          password.contains(new RegExp(r'[A-Z]')) &&
          password.contains(new RegExp(r'[a-z]')) &&
          password.contains(new RegExp(r'[0-9]'))) {
        _passwordStrength = 'normal';
      } else {
        _passwordStrength = 'low';
      }
    });
  }

  void _showSnackbar(String message) {
    try {
      Navigator.pop(context);
      SchedulerBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              message,
              style: TextStyle(
                fontFamily: 'NotoSansLao',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.red,
          ),
        );
      });
    } catch (e) {
      print('Error : $e');
    }
  }

  void _showsucces() {
    try {
      Navigator.pop(context);
      SchedulerBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: AlertDialog(
                title: Center(
                  child: Column(children: [
                    Icon(
                      Icons.check_circle_outline_rounded,
                      color: Colors.green,
                      size: 55,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'ບັນທືກ',
                      style: TextStyle(
                        fontFamily: 'NotoSansLao',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      'ສຳເລັດແລ້ວ',
                      style: TextStyle(
                        fontFamily: 'NotoSansLao',
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ]),
                ),
                actions: [
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/login'),
                      child: Text(
                        'ຕົກລົງ',
                        style: TextStyle(
                          fontFamily: 'NotoSansLao',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      });
    } catch (e) {
      print('Error : $e');
    }
  }

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
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(
      //   title: 'ສ້າງບັນຊີໃໝ່',
      // ),
      appBar: AppBar(
        title: Text(
          'ສ້າງບັນຊີໃໝ່',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontFamily: 'NotoSansLao',
          ),
        ),
        backgroundColor: HaxColor.colorOrange,
      ),
      body: BlocProvider(
        create: (context) => SignUpCubit(),
        child: BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            if (state is SignUpSuccess) {
              _showsucces();
            } else if (state is SignUpError) {
              _showSnackbar(state.message);
            }
            return Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _userController,
                        decoration: InputDecoration(
                          labelText: 'ໄອດີ',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: HaxColor.colorOrange),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '*';
                          } else {
                            return null;
                          }
                        },
                        style: TextStyle(
                          fontFamily: 'NotoSansLao',
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          labelText: 'ລະຫັດຜ່ານ',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '*';
                          } else if (_passwordStrength == 'low') {
                            return 'ລະຫັດຄວນມີໂຕໃຫຍ່, ຕົວເລກ, ຕົວອັກສອນພິເສດ ແລະ ຕົວອັກສອນຕ່ຳກວ່າ 8 ';
                          } else {
                            return null;
                          }
                        },
                        onChanged: _updatePasswordStrength,
                        style: TextStyle(
                          fontFamily: 'NotoSansLao',
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _confirmpasswordController,
                        obscureText: _obscureText2,
                        decoration: InputDecoration(
                          labelText: 'ຢືນຢັນລະຫັດຜ່ານ',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: HaxColor.colorOrange),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText2
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey.shade700,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText2 = !_obscureText2;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '*';
                          }
                          return null;
                        },
                        style: TextStyle(
                          fontFamily: 'NotoSansLao',
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _employeecodeController,
                        decoration: InputDecoration(
                          labelText: 'ລະຫັດພະນັກງານ',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: HaxColor.colorOrange),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '*';
                          }
                          return null;
                        },
                        style: TextStyle(
                          fontFamily: 'NotoSansLao',
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _namefullController,
                        decoration: InputDecoration(
                          labelText: 'ຊື່ແລະນາມສະກຸນ',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: HaxColor.colorOrange),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '*';
                          }
                          return null;
                        },
                        style: TextStyle(
                          fontFamily: 'NotoSansLao',
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      // TextFormField(
                      //   controller: _extracodeController,
                      //   decoration: InputDecoration(
                      //     labelText: 'ExtraCode',
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(15),
                      //       borderSide: BorderSide(color: HaxColor.colorOrange),
                      //     ),
                      //   ),
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return '*';
                      //     }
                      //     return null;
                      //   },
                      //   style: TextStyle(
                      //     fontFamily: 'NotoSansLao',
                      //     color: Colors.black,
                      //     fontSize: 16,
                      //   ),
                      // ),
                      // SizedBox(height: 16.0),
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () async {
                            final internetConnectivity = InternetConnectivity();
                            bool isConnected = await internetConnectivity
                                .checkInternetConnectivity();
                            if (!isConnected) {
                              FormShowDialog.showAlertDialog(
                                  context, 'ຂໍອະໄພ! ມີບັນຫາໃນການເຊື່ອມຕໍ່');
                              return;
                            }

                            AlertRegister.showLoadingDialog(context);

                            if (_userController.text.isEmpty &&
                                _passwordController.text.isEmpty &&
                                _confirmpasswordController.text.isEmpty &&
                                _employeecodeController.text.isEmpty &&
                                _namefullController.text.isEmpty) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'ກະລຸນາປ້ອນຂໍ້ມູນໃຫ້ຄົບ...!!',
                                    style: TextStyle(
                                      fontFamily: 'NotoSansLao',
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            } else if (_confirmpasswordController.text !=
                                _passwordController.text) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'ກະລຸນາກວດລະຫັດຜ່ານຄືນໃໝ່ບໍ່ຕົງກັນ...!!',
                                    style: TextStyle(
                                      fontFamily: 'NotoSansLao',
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }

                            final username = _userController.text.trim();
                            final password = _passwordController.text.trim();
                            final employeeCode =
                                _employeecodeController.text.trim();
                            final fullName = _namefullController.text.trim();

                            context.read<SignUpCubit>().signUp(
                                username, password, employeeCode, fullName);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: HaxColor.colorOrange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Text(
                            "ລົງທະບຽນ", //LOGIN
                            style: TextStyle(
                              fontFamily: 'NotoSansLao',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
