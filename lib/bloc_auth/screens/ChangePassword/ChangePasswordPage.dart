import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../contact/HaxColors.dart';
import '../../changePassword/ChangePasswordCubit.dart';

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
              // _showsucces();
            } else if (state is ChangeError) {
              // _showSnackbar(state.message);
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
                          onPressed: () async {},
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
