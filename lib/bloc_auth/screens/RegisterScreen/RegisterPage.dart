import 'package:flutter/material.dart';

import '../../../contact/HaxColors.dart';
import '../../widgets/CustomAppBar.dart';

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
  final _extracodeController = TextEditingController();
  bool _obscureText = true;
  bool _obscureText2 = true;
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

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'ສ້າງບັນຊີໃໝ່',
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            key: _formKey,
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
                        _obscureText ? Icons.visibility : Icons.visibility_off,
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
                      return 'ລະຫັດຄວນມີໂຕໃຫຍ່, ຕົວເລກ, ຕົວອັກສອນພິເສດ...';
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
                        _obscureText2 ? Icons.visibility : Icons.visibility_off,
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
                TextFormField(
                  controller: _extracodeController,
                  decoration: InputDecoration(
                    labelText: 'ExtraCode',
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
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      // if (_userController.text.isEmpty &&
                      //     _passwordController.text.isEmpty &&
                      //     _confirmpasswordController.text.isEmpty &&
                      //     _employeecodeController.text.isEmpty &&
                      //     _namefullController.text.isEmpty &&
                      //     _extracodeController.text.isEmpty) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //       content: Text(
                      //         'ກະລຸນາປ້ອນຂໍ້ມູນໃຫ້ຄົບ...!!',
                      //         style: TextStyle(
                      //           fontFamily: 'NotoSansLao',
                      //           fontSize: 16,
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //       backgroundColor: Colors.red,
                      //     ),
                      //   );
                      // }
                      // if (_confirmpasswordController.text !=
                      //     _passwordController.text) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //       content: Text(
                      //         'ກະລຸນາກວດລະຫັດຜ່ານຄືນໃໝ່ບໍ່ຕົງກັນ...!!',
                      //         style: TextStyle(
                      //           fontFamily: 'NotoSansLao',
                      //           fontSize: 16,
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //       backgroundColor: Colors.red,
                      //     ),
                      //   );
                      // }
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
      ),
    );
  }
}
