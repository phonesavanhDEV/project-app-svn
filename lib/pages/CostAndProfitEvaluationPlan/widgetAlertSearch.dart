import 'package:flutter/material.dart';
import 'dart:ui';

class AlertDialogSearch extends StatefulWidget {
  @override
  _AlertDialogSearch createState() => _AlertDialogSearch();
}

class _AlertDialogSearch extends State<AlertDialogSearch> {
  TextEditingController _productIDController = TextEditingController();

  String _dropdownvalue = 'Option 1';
  List<String> items = ['Option 1', 'Option 2', 'Option 3'];

  @override
  void dispose() {
    _productIDController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
      child: AlertDialog(
        title: Center(
          child: Text(
            'ຄົ້ນຫາ',
            style: TextStyle(
              fontFamily: 'NotoSansLao',
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16.0),
              Text(
                'ລະຫັດສິນຄ້າ',
                style: TextStyle(
                  fontFamily: 'NotoSansLao',
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              TextFormField(
                controller: _productIDController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                style: TextStyle(
                  fontFamily: 'NotoSansLao',
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'ໝວດສິນຄ້າ',
                style: TextStyle(
                  fontFamily: 'NotoSansLao',
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              Container(
                width: double.infinity,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  isExpanded: true,
                  value: _dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(item),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'ກຸ່ມສິນຄ້າ',
                style: TextStyle(
                  fontFamily: 'NotoSansLao',
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              Container(
                width: double.infinity,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  isExpanded: true,
                  value: _dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(item),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'ຍີ່ຫໍ້ສິນຄ້າ',
                style: TextStyle(
                  fontFamily: 'NotoSansLao',
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              Container(
                width: double.infinity,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  isExpanded: true,
                  value: _dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(item),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'ປະເພດສິນຄ້າ',
                style: TextStyle(
                  fontFamily: 'NotoSansLao',
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              Container(
                width: double.infinity,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  isExpanded: true,
                  value: _dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(item),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'ຜູ້ສະໜອງ',
                style: TextStyle(
                  fontFamily: 'NotoSansLao',
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              Container(
                width: double.infinity,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  isExpanded: true,
                  value: _dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(item),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'ສາຂາ',
                style: TextStyle(
                  fontFamily: 'NotoSansLao',
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              Container(
                width: double.infinity,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  isExpanded: true,
                  value: _dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(item),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        actions: [
          Center(
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () => Navigator.of(context).pop(),
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
          ),
        ],
      ),
    );
  }
}
