import 'package:json_annotation/json_annotation.dart';

part 'productBrandModel.g.dart';

@JsonSerializable()
class ProductBrandModel {
  @JsonKey(name: 'product_brand_code')
  final String BrandCode;

  @JsonKey(name: 'product_brand_name')
  final String BrandName;

  ProductBrandModel({
    required this.BrandCode,
    required this.BrandName,
  });

  factory ProductBrandModel.fromJson(Map<String, dynamic> json) =>
      _$ProductBrandModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductBrandModelToJson(this);

  @override
  String toString() {
    return 'ProductBrandModel{BrandCode: $BrandCode, BrandName: $BrandName}';
  }

  bool isEqual(ProductBrandModel s) {
    return s.BrandCode == s.BrandCode && s.BrandName == s.BrandName;
  }
}
