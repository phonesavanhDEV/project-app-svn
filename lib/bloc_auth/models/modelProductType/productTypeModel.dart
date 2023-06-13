import 'package:json_annotation/json_annotation.dart';

part 'productTypeModel.g.dart';

@JsonSerializable()
class ProductTypeModel {
  @JsonKey(name: 'product_type_code')
  final String productTypeCode;

  @JsonKey(name: 'product_type_name')
  final String productTypeName;

  ProductTypeModel({
    required this.productTypeCode,
    required this.productTypeName,
  });

  factory ProductTypeModel.fromJson(Map<String, dynamic> json) =>
      _$ProductTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductTypeModelToJson(this);

  @override
  String toString() {
    return 'ProductTypeModel{productTypeCode: $productTypeCode, productTypeName: $productTypeName}';
  }

  bool isEqual(ProductTypeModel s) {
    return s.productTypeCode == s.productTypeCode &&
        s.productTypeName == s.productTypeName;
  }
}
