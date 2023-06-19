import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

import '../../path/pathContact.dart';

class SearchDataCubit extends Cubit<SearchDataState> {
  SearchDataCubit() : super(SearchDataInitial());
  final pathContact contactPath = pathContact();

  void searchData(
      String pluscode,
      String productcode,
      String productcategorycode,
      String productgroupcode,
      String productbrandname,
      String producttypename,
      String vendorcode,
      String branchname) async {
    emit(SearchDataLoading());

    final response = await http.post(
      Uri.parse(contactPath.postRepoPathSearch()),
      body: {
        'pluscode': pluscode,
        'productcode': productcode,
        'productcategorycode': productcategorycode,
        'userfullname': productgroupcode,
        'productbrandname': productbrandname,
        'producttypename': producttypename,
        'vendorcode': vendorcode,
        'branchname': branchname
      },
    );

    if (response.statusCode == 200) {
      try {
        emit(SearchDataSuccess(response.body));
      } catch (e) {
        if (e is FormatException) {
          print('Invalid JSON data: ${e.message}');
        } else {
          print('Error decoding JSON data: $e');
        }
      }
    } else {
      final errorMessage = response.reasonPhrase ?? 'An error occurred';
      emit(SearchDataError(errorMessage));
    }
  }
}

abstract class SearchDataState {}

class SearchDataInitial extends SearchDataState {}

class SearchDataLoading extends SearchDataState {}

class SearchDataSuccess extends SearchDataState {
  final dynamic data;

  SearchDataSuccess(this.data);
}

class SearchDataError extends SearchDataState {
  final String message;

  SearchDataError(this.message);
}
