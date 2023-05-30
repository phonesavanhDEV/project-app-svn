import 'package:flutter/material.dart';

import '../../../models/modelProductCategory/productCategoryModel.dart';

class CategoryProduct extends StatelessWidget {
  final ProductCategoryModel item;

  const CategoryProduct({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          ListTile(
            title: Text(item.CategoryCode),
            subtitle: Text(item.CategoryName),
          ),
          Divider(),
        ],
      ),
    );
  }
}
