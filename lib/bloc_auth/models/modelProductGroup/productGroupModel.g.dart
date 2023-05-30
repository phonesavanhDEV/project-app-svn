// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productGroupModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductGroupModel _$ProductGroupModelFromJson(Map<String, dynamic> json) =>
    ProductGroupModel(
      productGroupCode: json['product_group_code'] as String,
      productGroupName: json['product_group_name'] as String,
    );

Map<String, dynamic> _$ProductGroupModelToJson(ProductGroupModel instance) =>
    <String, dynamic>{
      'product_group_code': instance.productGroupCode,
      'product_group_name': instance.productGroupName,
    };
