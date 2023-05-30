// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productBrandModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductBrandModel _$ProductBrandModelFromJson(Map<String, dynamic> json) =>
    ProductBrandModel(
      BrandCode: json['product_brand_code'] as String,
      BrandName: json['product_brand_name'] as String,
    );

Map<String, dynamic> _$ProductBrandModelToJson(ProductBrandModel instance) =>
    <String, dynamic>{
      'product_brand_code': instance.BrandCode,
      'product_brand_name': instance.BrandName,
    };
