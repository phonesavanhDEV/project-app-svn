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
