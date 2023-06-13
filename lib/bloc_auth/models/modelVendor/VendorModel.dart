import 'package:json_annotation/json_annotation.dart';

part 'VendorModel.g.dart';

@JsonSerializable()
class VendorModel {
  @JsonKey(name: 'vendor_code')
  final String VendorCode;

  @JsonKey(name: 'vendor_name')
  final String VendorName;

  VendorModel({
    required this.VendorCode,
    required this.VendorName,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) =>
      _$VendorModelFromJson(json);

  Map<String, dynamic> toJson() => _$VendorModelToJson(this);

  @override
  String toString() {
    return 'VendorModel{VendorCode: $VendorCode, VendorName: $VendorName}';
  }

  bool isEqual(VendorModel s) {
    return s.VendorCode == s.VendorCode && s.VendorName == s.VendorName;
  }
}
