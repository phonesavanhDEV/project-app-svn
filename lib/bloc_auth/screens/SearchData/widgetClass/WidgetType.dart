import 'package:flutter/material.dart';

import '../../../models/modelProductType/productTypeModel.dart';

class TypeProduct extends StatelessWidget {
  final ProductTypeModel item;

  const TypeProduct({
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
            title: Text(item.productTypeCode),
            subtitle: Text(item.productTypeName),
          ),
          Divider(),
        ],
      ),
    );
  }
}
