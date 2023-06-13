// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productTypeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductTypeModel _$ProductTypeModelFromJson(Map<String, dynamic> json) =>
    ProductTypeModel(
      productTypeCode: json['product_type_code'] as String,
      productTypeName: json['product_type_name'] as String,
    );

Map<String, dynamic> _$ProductTypeModelToJson(ProductTypeModel instance) =>
    <String, dynamic>{
      'product_type_code': instance.productTypeCode,
      'product_type_name': instance.productTypeName,
    };
