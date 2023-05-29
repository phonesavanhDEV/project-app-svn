import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../contact/HaxColors.dart';
import '../../../network/CheckNetwork.dart';
import '../../changePassword/ChangePasswordCubit.dart';
import '../LoginScreen/FormShowDialog.dart';
import '../RegisterScreen/AlertRegister.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPage createState() => _ChangePasswordPage();
}

class _ChangePasswordPage extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _oldpasswordController = TextEditingController();
  final _newpasswordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  bool _obscureTextold = true;
  bool _obscureTextnew = true;
  bool _obscureTextconfirm = true;
  String _passwordStrength = '';

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
                      'ປ່ຽນລະຫັດຜ່ານສຳເລັດແລ້ວ',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ປ່ຽນລະຫັດຜ່ານ',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontFamily: 'NotoSansLao',
          ),
        ),
        backgroundColor: HaxColor.colorOrange,
      ),
      body: BlocProvider(
        create: (context) => ChangeCubit(),
        child: BlocBuilder<ChangeCubit, ChangeState>(
          builder: (context, state) {
            if (state is ChangeSuccess) {
              _showsucces();
            } else if (state is ChangeError) {
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
                        controller: _oldpasswordController,
                        obscureText: _obscureTextold,
                        decoration: InputDecoration(
                          labelText: 'ລະຫັດຜ່ານເກົ່າ',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: HaxColor.colorOrange),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureTextold
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey.shade700,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureTextold = !_obscureTextold;
                              });
                            },
                          ),
                        ),
                        style: TextStyle(
                          fontFamily: 'NotoSansLao',
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _newpasswordController,
                        obscureText: _obscureTextnew,
                        decoration: InputDecoration(
                          labelText: 'ລະຫັດຜ່ານໃໝ່',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: HaxColor.colorOrange),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureTextnew
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey.shade700,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureTextnew = !_obscureTextnew;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (_passwordStrength == 'low') {
                            return 'ລະຫັດຄວນມີໂຕໃຫຍ່, ຕົວເລກ, ຕົວອັກສອນພິເສດ ແລະ ຕົວອັກສອນຕ່ຳກວ່າ 8';
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
                        obscureText: _obscureTextconfirm,
                        decoration: InputDecoration(
                          labelText: 'ຢືນຢັນລະຫັດຜ່ານ',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: HaxColor.colorOrange),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureTextconfirm
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey.shade700,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureTextconfirm = !_obscureTextconfirm;
                              });
                            },
                          ),
                        ),
                        style: TextStyle(
                          fontFamily: 'NotoSansLao',
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 16.0),
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

                            if (_oldpasswordController.text.isEmpty &&
                                _newpasswordController.text.isEmpty &&
                                _confirmpasswordController.text.isEmpty) {
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
                                _newpasswordController.text) {
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
                            final userpassword =
                                _oldpasswordController.text.trim();
                            final newpassword =
                                _newpasswordController.text.trim();

                            context
                                .read<ChangeCubit>()
                                .changepassword(userpassword, newpassword);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: HaxColor.colorOrange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Text(
                            "OK", //LOGIN
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
