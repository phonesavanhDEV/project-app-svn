import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../models/UserModel.dart';

class CategoryProduct extends StatelessWidget {
  final UserModel item;
  final bool isSelected;

  const CategoryProduct({
    Key? key,
    required this.item,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(item.name),
        subtitle: Text(item.createdAt.toString()),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(item.avatar),
        ),
      ),
    );
  }
}
