// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productCategoryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategoryModel _$ProductCategoryModelFromJson(
        Map<String, dynamic> json) =>
    ProductCategoryModel(
      CategoryCode: json['product_category_code'] as String,
      CategoryName: json['product_category_name'] as String,
    );

Map<String, dynamic> _$ProductCategoryModelToJson(
        ProductCategoryModel instance) =>
    <String, dynamic>{
      'product_category_code': instance.CategoryCode,
      'product_category_name': instance.CategoryName,
    };
