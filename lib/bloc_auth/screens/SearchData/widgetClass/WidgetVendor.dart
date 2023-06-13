import 'package:flutter/material.dart';

import '../../../models/modelVendor/VendorModel.dart';

class VendorMaster extends StatelessWidget {
  final VendorModel item;

  const VendorMaster({
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
            title: Text(item.VendorCode),
            subtitle: Text(item.VendorName),
          ),
          Divider(),
        ],
      ),
    );
  }
}
