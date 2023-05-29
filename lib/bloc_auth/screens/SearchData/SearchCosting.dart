import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../contact/HaxColors.dart';
import '../../models/UserModel.dart';
import 'WidgetCategory.dart';
import 'package:http/http.dart' as http;

class SearchCosting extends StatefulWidget {
  @override
  _SearchCostingState createState() => _SearchCostingState();
}

class _SearchCostingState extends State<SearchCosting> {
  final _formKey = GlobalKey<FormState>();
  final _popupCustomValidationKey = GlobalKey<DropdownSearchState<int>>();

  final _plusIDController = TextEditingController();
  final _productIDController = TextEditingController();

  @override
  void dispose() {
    _plusIDController.dispose();
    _productIDController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ຄົ້ນຫາຂໍ້ມູນ',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontFamily: 'NotoSansLao',
          ),
        ),
        backgroundColor: HaxColor.colorOrange,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: EdgeInsets.all(4),
            children: <Widget>[
              SizedBox(height: 16.0),
              TextFormField(
                controller: _plusIDController,
                decoration: InputDecoration(
                  labelText: 'ລະຫັດບວກ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: HaxColor.colorOrange),
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
                controller: _productIDController,
                decoration: InputDecoration(
                  labelText: 'ລະຫັດສິນຄ້າ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: HaxColor.colorOrange),
                  ),
                ),
                style: TextStyle(
                  fontFamily: 'NotoSansLao',
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<UserModel>(
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          hintText: "ໝວດສິນຄ້າ",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      asyncItems: (filter) => getData(filter),
                      compareFn: (i, s) => i.isEqual(s),
                      itemAsString: (UserModel u) => u.name,
                      popupProps: PopupPropsMultiSelection.dialog(
                          isFilterOnline: true,
                          showSelectedItems: true,
                          showSearchBox: true,
                          itemBuilder: (context, item, isSelected) =>
                              CategoryProduct(
                                item: item,
                                isSelected: isSelected,
                              )),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<UserModel>(
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          hintText: "ກຸ່ມສິນຄ້າ",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      // asyncItems: (filter) => getData(filter),
                      compareFn: (i, s) => i.isEqual(s),
                      //itemAsString: (UserModel u) => u.name,
                      popupProps: PopupPropsMultiSelection.dialog(
                        isFilterOnline: true,
                        showSelectedItems: true,
                        showSearchBox: true,
                        //itemBuilder: _customPopupItemBuilderExample2,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<UserModel>(
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          hintText: "ຍີ່ຫໍ້ສິນຄ້າ",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      // asyncItems: (filter) => getData(filter),
                      compareFn: (i, s) => i.isEqual(s),
                      //itemAsString: (UserModel u) => u.name,
                      popupProps: PopupPropsMultiSelection.dialog(
                        isFilterOnline: true,
                        showSelectedItems: true,
                        showSearchBox: true,
                        //itemBuilder: _customPopupItemBuilderExample2,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<UserModel>(
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          hintText: "ປະເພດສິນຄ້າ",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      //asyncItems: (filter) => getData(filter),
                      compareFn: (i, s) => i.isEqual(s),
                      //itemAsString: (UserModel u) => u.name,
                      popupProps: PopupPropsMultiSelection.dialog(
                        isFilterOnline: true,
                        showSelectedItems: true,
                        showSearchBox: true,
                        //itemBuilder: _customPopupItemBuilderExample2,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<UserModel>(
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          hintText: "ຜູ້ສະໜອງ",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      //asyncItems: (filter) => getData(filter),
                      compareFn: (i, s) => i.isEqual(s),
                      //itemAsString: (UserModel u) => u.name,
                      popupProps: PopupPropsMultiSelection.dialog(
                        isFilterOnline: true,
                        showSelectedItems: true,
                        showSearchBox: true,
                        //itemBuilder: _customPopupItemBuilderExample2,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<UserModel>(
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          hintText: "ສາຂາ",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      //asyncItems: (filter) => getData(filter),
                      compareFn: (i, s) => i.isEqual(s),
                      //itemAsString: (UserModel u) => u.name,
                      popupProps: PopupPropsMultiSelection.dialog(
                        isFilterOnline: true,
                        showSelectedItems: true,
                        showSearchBox: true,
                        // itemBuilder: _customPopupItemBuilderExample2,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: HaxColor.colorOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    "ຄົ້ນຫາ",
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
  }

  Future<List<UserModel>> getData(filter) async {
    var response = await Dio().get(
      "https://souvanny.la/costing/CostingAPI/system/MasterBranch",
      queryParameters: {"filter": filter},
    );

    final data = response.data;
    if (data != null) {
      return UserModel.fromJsonList(data);
    }

    return [];
  }

  // Future<List<UserModel>> getData(filter) async {
  //   var response = await http.get(
  //     Uri.parse("https://souvanny.la/costing/CostingAPI/system/iLoaddata"),
  //     queryParameters: {"filter": filter},
  //   );

  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body);
  //     if (data != null) {
  //       return UserModel.fromJsonList(data);
  //     }
  //   }

  //   return [];
  // }
}
