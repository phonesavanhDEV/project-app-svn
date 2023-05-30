import 'package:flutter/material.dart';

import '../../../models/modelProductGroup/productGroupModel.dart';

class GroupProduct extends StatelessWidget {
  final ProductGroupModel item;

  const GroupProduct({
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
            title: Text(item.productGroupCode),
            subtitle: Text(item.productGroupName),
          ),
          Divider(),
        ],
      ),
    );
  }
}
