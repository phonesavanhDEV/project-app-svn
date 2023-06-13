// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VendorModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorModel _$VendorModelFromJson(Map<String, dynamic> json) => VendorModel(
      VendorCode: json['vendor_code'] as String,
      VendorName: json['vendor_name'] as String,
    );

Map<String, dynamic> _$VendorModelToJson(VendorModel instance) =>
    <String, dynamic>{
      'vendor_code': instance.VendorCode,
      'vendor_name': instance.VendorName,
    };
