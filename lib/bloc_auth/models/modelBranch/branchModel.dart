import 'package:json_annotation/json_annotation.dart';

part 'branchModel.g.dart';

@JsonSerializable()
class BranchModel {
  @JsonKey(name: 'branch_code')
  final String branchCode;

  @JsonKey(name: 'branch_name')
  final String branchName;

  BranchModel({
    required this.branchCode,
    required this.branchName,
  });

  factory BranchModel.fromJson(Map<String, dynamic> json) =>
      _$BranchModelFromJson(json);

  Map<String, dynamic> toJson() => _$BranchModelToJson(this);

  @override
  String toString() {
    return 'BranchModel{branchCode: $branchCode, branchName: $branchName}';
  }

  bool isEqual(BranchModel s) {
    return s.branchCode == s.branchCode && s.branchName == s.branchName;
  }
}
