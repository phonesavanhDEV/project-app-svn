import 'package:flutter/material.dart';

import '../../../models/modelProductBrand/productBrandModel.dart';

class BrandProduct extends StatelessWidget {
  final ProductBrandModel item;

  const BrandProduct({
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
            title: Text(item.BrandCode),
            subtitle: Text(item.BrandName),
          ),
          Divider(),
        ],
      ),
    );
  }
}
