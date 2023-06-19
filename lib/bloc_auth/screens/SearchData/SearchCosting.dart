import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svn_costing_profit/bloc_auth/screens/SearchData/widgetClass/WidgetBranch.dart';
import 'package:svn_costing_profit/bloc_auth/screens/SearchData/widgetClass/WidgetBrand.dart';
import 'package:svn_costing_profit/bloc_auth/screens/SearchData/widgetClass/WidgetGroup.dart';
import 'package:svn_costing_profit/bloc_auth/screens/SearchData/widgetClass/WidgetVendor.dart';

import '../../../contact/HaxColors.dart';
import '../../../path/pathContact.dart';
import '../../models/UserModel.dart';
import '../../models/modelBranch/branchModel.dart';
import '../../models/modelProductBrand/productBrandModel.dart';
import '../../models/modelProductCategory/productCategoryModel.dart';
import '../../models/modelProductGroup/productGroupModel.dart';
import '../../models/modelProductType/productTypeModel.dart';
import '../../models/modelVendor/VendorModel.dart';
import '../../searchdata/SearchDataCubit.dart';
import 'widgetClass/WidgetCategory.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'widgetClass/WidgetType.dart';

part 'PartSearch.dart';

class SearchCosting extends StatefulWidget {
  @override
  _SearchCostingState createState() => _SearchCostingState();
}

class _SearchCostingState extends State<SearchCosting> {
  final _formKey = GlobalKey<FormState>();

  final _plusIDController = TextEditingController();
  final _productIDController = TextEditingController();

  ProductCategoryModel? _selectedProductCategory;
  ProductGroupModel? _selectedProductGroup;
  ProductBrandModel? _selectProductBrand;
  ProductTypeModel? _selectProductType;
  VendorModel? _selectVendor;
  BranchModel? _selectBranch;

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
                    child: DropdownSearch<ProductCategoryModel>(
                      onChanged: (value) {
                        setState(() {
                          _selectedProductCategory = value!;
                        });
                      },
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          hintText: "ໝວດສິນຄ້າ",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      clearButtonProps: ClearButtonProps(isVisible: true),
                      asyncItems: (filter) => getDataCategory(filter),
                      compareFn: (i, s) => i.isEqual(s),
                      itemAsString: (ProductCategoryModel u) => u.CategoryCode,
                      popupProps: PopupPropsMultiSelection.dialog(
                        isFilterOnline: true,
                        showSearchBox: true,
                        itemBuilder: (context, item, isSelected) =>
                            CategoryProduct(
                          item: item,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<ProductGroupModel>(
                      onChanged: (value) {
                        setState(() {
                          _selectedProductGroup = value!;
                        });
                      },
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          hintText: "ກຸ່ມສິນຄ້າ",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      clearButtonProps: ClearButtonProps(isVisible: true),
                      asyncItems: (filter) => getDataGroup(filter),
                      compareFn: (i, s) => i.isEqual(s),
                      itemAsString: (ProductGroupModel u) => u.productGroupCode,
                      popupProps: PopupPropsMultiSelection.dialog(
                        isFilterOnline: true,
                        showSearchBox: true,
                        itemBuilder: (context, item, isSelected) =>
                            GroupProduct(
                          item: item,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<ProductBrandModel>(
                      onChanged: (value) {
                        setState(() {
                          _selectProductBrand = value!;
                        });
                      },
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          hintText: "ຍີ່ຫໍ້ສິນຄ້າ",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      clearButtonProps: ClearButtonProps(isVisible: true),
                      asyncItems: (filter) => getDataBrand(filter),
                      compareFn: (i, s) => i.isEqual(s),
                      itemAsString: (ProductBrandModel u) => u.BrandName,
                      popupProps: PopupPropsMultiSelection.dialog(
                        isFilterOnline: true,
                        showSelectedItems: true,
                        showSearchBox: true,
                        itemBuilder: (context, item, isSelected) =>
                            BrandProduct(
                          item: item,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<ProductTypeModel>(
                      onChanged: (value) {
                        setState(() {
                          _selectProductType = value!;
                        });
                      },
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          hintText: "ປະເພດສິນຄ້າ",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      clearButtonProps: ClearButtonProps(isVisible: true),
                      asyncItems: (filter) => getDataType(filter),
                      compareFn: (i, s) => i.isEqual(s),
                      itemAsString: (ProductTypeModel u) => u.productTypeName,
                      popupProps: PopupPropsMultiSelection.dialog(
                        isFilterOnline: true,
                        showSelectedItems: true,
                        showSearchBox: true,
                        itemBuilder: (context, item, isSelected) => TypeProduct(
                          item: item,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<VendorModel>(
                      onChanged: (value) {
                        setState(() {
                          _selectVendor = value!;
                        });
                      },
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          hintText: "ຜູ້ສະໜອງ",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      clearButtonProps: ClearButtonProps(isVisible: true),
                      asyncItems: (filter) => getDataVendor(filter),
                      compareFn: (i, s) => i.isEqual(s),
                      itemAsString: (VendorModel u) => u.VendorCode,
                      popupProps: PopupPropsMultiSelection.dialog(
                        isFilterOnline: true,
                        showSelectedItems: true,
                        showSearchBox: true,
                        itemBuilder: (context, item, isSelected) =>
                            VendorMaster(
                          item: item,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<BranchModel>(
                      onChanged: (value) {
                        setState(() {
                          _selectBranch = value!;
                        });
                      },
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          hintText: "ສາຂາ",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      clearButtonProps: ClearButtonProps(isVisible: true),
                      asyncItems: (filter) => getData(filter),
                      compareFn: (i, s) => i.isEqual(s),
                      itemAsString: (BranchModel u) => u.branchName,
                      popupProps: PopupPropsMultiSelection.dialog(
                        isFilterOnline: true,
                        showSearchBox: true,
                        itemBuilder: (context, item, isSelected) => BranchData(
                          item: item,
                        ),
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
                    // Navigator.pop(context);
                    final pluscode = _plusIDController.text.trim();
                    final productcode = _productIDController.text.trim();
                    final productcategorycode =
                        _selectedProductCategory?.CategoryCode ?? '';
                    final productgroupcode =
                        _selectedProductGroup?.productGroupCode ?? '';
                    final productbrandname =
                        _selectProductBrand?.BrandName ?? '';
                    final producttypename =
                        _selectProductType?.productTypeName ?? '';
                    final vendorcode = _selectVendor?.VendorCode ?? '';
                    final branchname = _selectBranch?.branchName ?? '';

                    context.read<SearchDataCubit>().searchData(
                        pluscode,
                        productcode,
                        productcategorycode,
                        productgroupcode,
                        productbrandname,
                        producttypename,
                        vendorcode,
                        branchname);
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
}
