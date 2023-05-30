import 'package:flutter/material.dart';

import '../../../models/modelBranch/branchModel.dart';

class BranchData extends StatelessWidget {
  final BranchModel item;

  const BranchData({
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
            title: Text(item.branchCode),
            subtitle: Text(item.branchName),
          ),
          Divider(),
        ],
      ),
    );
  }
}
