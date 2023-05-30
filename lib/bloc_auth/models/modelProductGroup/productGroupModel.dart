import 'package:json_annotation/json_annotation.dart';

part 'productGroupModel.g.dart';

@JsonSerializable()
class ProductGroupModel {
  @JsonKey(name: 'product_group_code')
  final String productGroupCode;

  @JsonKey(name: 'product_group_name')
  final String productGroupName;

  ProductGroupModel({
    required this.productGroupCode,
    required this.productGroupName,
  });

  factory ProductGroupModel.fromJson(Map<String, dynamic> json) =>
      _$ProductGroupModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductGroupModelToJson(this);

  @override
  String toString() {
    return 'ProductGroupModel{productGroupCode: $productGroupCode, productGroupName: $productGroupName}';
  }

  bool isEqual(ProductGroupModel s) {
    return s.productGroupCode == s.productGroupCode &&
        s.productGroupName == s.productGroupName;
  }
}
