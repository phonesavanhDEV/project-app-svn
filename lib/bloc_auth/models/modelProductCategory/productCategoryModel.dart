import 'package:json_annotation/json_annotation.dart';

part 'productCategoryModel.g.dart';

@JsonSerializable()
class ProductCategoryModel {
  @JsonKey(name: 'product_category_code')
  final String CategoryCode;

  @JsonKey(name: 'product_category_name')
  final String CategoryName;

  ProductCategoryModel({
    required this.CategoryCode,
    required this.CategoryName,
  });

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryModelToJson(this);

  @override
  String toString() {
    return 'BranchModel{CategoryCode: $CategoryCode, CategoryName: $CategoryName}';
  }

  bool isEqual(ProductCategoryModel s) {
    return s.CategoryCode == s.CategoryCode && s.CategoryName == s.CategoryName;
  }
}
