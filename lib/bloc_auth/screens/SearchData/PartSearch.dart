part of 'SearchCosting.dart';

Future<List<BranchModel>> getData(String? filter) async {
  try {
    var url = Uri.parse(pathContact().getRepoPathBranch());

    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<BranchModel> branchList = [];
      var jsonData = jsonDecode(response.body);
      for (var branchData in jsonData) {
        BranchModel branch = BranchModel.fromJson(branchData);
        if (filter == null ||
            branch.branchName.contains(filter) ||
            branch.branchCode.contains(filter)) {
          branchList.add(branch);
        }
      }

      return branchList;
    } else {
      print('HTTP request failed with status code: ${response.statusCode}');
      return [];
    }
  } catch (error) {
    print('Error retrieving data: $error');
    return [];
  }
}

Future<List<ProductCategoryModel>> getDataCategory(String? filter) async {
  try {
    var url = Uri.parse(pathContact().getRepoPathProductCategory());

    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<ProductCategoryModel> productCategory = [];
      var jsonData = jsonDecode(response.body);
      for (var categoryData in jsonData) {
        ProductCategoryModel category =
            ProductCategoryModel.fromJson(categoryData);
        if (filter == null ||
            category.CategoryCode.contains(filter) ||
            category.CategoryName.contains(filter)) {
          productCategory.add(category);
        }
      }

      return productCategory;
    } else {
      print('HTTP request failed with status code: ${response.statusCode}');
      return [];
    }
  } catch (error) {
    print('Error retrieving data: $error');
    return [];
  }
}

Future<List<ProductGroupModel>> getDataGroup(String? filter) async {
  try {
    var url = Uri.parse(pathContact().getRepoPathProductGroup());

    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<ProductGroupModel> productGroup = [];
      var jsonData = jsonDecode(response.body);
      for (var groupData in jsonData) {
        ProductGroupModel group = ProductGroupModel.fromJson(groupData);
        if (filter == null ||
            group.productGroupCode.contains(filter) ||
            group.productGroupName.contains(filter)) {
          productGroup.add(group);
        }
      }

      return productGroup;
    } else {
      print('HTTP request failed with status code: ${response.statusCode}');
      return [];
    }
  } catch (error) {
    print('Error retrieving data: $error');
    return [];
  }
}

Future<List<ProductBrandModel>> getDataBrand(String? filter) async {
  try {
    var url = Uri.parse(pathContact().getRepoPathProductBrand());

    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<ProductBrandModel> productBrand = [];
      var jsonData = jsonDecode(response.body);
      for (var brandData in jsonData) {
        ProductBrandModel brand = ProductBrandModel.fromJson(brandData);
        if (filter == null ||
            brand.BrandCode.contains(filter) ||
            brand.BrandName.contains(filter)) {
          productBrand.add(brand);
        }
      }

      return productBrand;
    } else {
      print('HTTP request failed with status code: ${response.statusCode}');
      return [];
    }
  } catch (error) {
    print('Error retrieving data: $error');
    return [];
  }
}
