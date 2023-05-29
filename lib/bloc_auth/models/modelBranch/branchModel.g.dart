// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branchModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchModel _$BranchModelFromJson(Map<String, dynamic> json) => BranchModel(
      branchCode: json['branch_code'] as String,
      branchName: json['branch_name'] as String,
    );

Map<String, dynamic> _$BranchModelToJson(BranchModel instance) =>
    <String, dynamic>{
      'branch_code': instance.branchCode,
      'branch_name': instance.branchName,
    };
