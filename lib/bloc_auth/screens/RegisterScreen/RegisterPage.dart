import 'package:flutter/material.dart';

import '../../../contact/HaxColors.dart';
import '../../widgets/CustomAppBar.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'ໄອດີ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: HaxColor.colorOrange),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'ກະລຸນາໄອດີ';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'ລະຫັດຜ່ານ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: HaxColor.colorOrange),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'ກະລຸນາປ້ອນລະຫັດຜ່ານ';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'ຢືນຢັນລະຫັດຜ່ານ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: HaxColor.colorOrange),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'ກະລຸນາປ້ອນຢືນຢັນລະຫັດຜ່ານ';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'ລະຫັດພະນັກງານ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: HaxColor.colorOrange),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'ກະລຸນາປ້ອນລະຫັດພະນັກງານ';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'ຊື່ແລະນາມສະກຸນ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: HaxColor.colorOrange),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'ກະລຸນາປ້ອນຊື່ແລະນາມສະກຸນ';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'ExtraCode',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: HaxColor.colorOrange),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'ກະລຸນາປ້ອນExtraCode';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: HaxColor.colorOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "ລົງທະບຽນ", //LOGIN
                  style: TextStyle(
                    fontFamily: 'NotoSansLao',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
