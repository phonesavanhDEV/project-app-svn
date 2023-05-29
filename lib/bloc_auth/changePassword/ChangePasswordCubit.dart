import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../path/pathContact.dart';

class ChangeCubit extends Cubit<ChangeState> {
  ChangeCubit() : super(ChangeInitial());
  final pathContact contactPath = pathContact();

  void changepassword(String userpassword, String newpassword) async {
    emit(ChangeLoading());

    final response = await http.post(
      Uri.parse(contactPath.getRepoPathChangePassword()),
      body: {
        'userpassword': userpassword,
        'newpassword': newpassword,
      },
    );

    if (response.statusCode == 200) {
      // final data = jsonDecode(response.body);
      try {
        // final data = jsonDecode(response.body);
        emit(ChangeSuccess(response.body));
      } catch (e) {
        if (e is FormatException) {
          print('Invalid JSON data: ${e.message}');
        } else {
          print('Error decoding JSON data: $e');
        }
      }

      // emit(SignUpSuccess(data));
    } else {
      //final errorMessage = response.reasonPhrase ?? 'An error occurred';
      final errorMessage = 'ລະຫັດຜ່ານຜິດພາດ ກະລຸນາກວດສອບຄືນ';
      emit(ChangeError(errorMessage));
    }
  }
}

abstract class ChangeState {}

class ChangeInitial extends ChangeState {}

class ChangeLoading extends ChangeState {}

class ChangeSuccess extends ChangeState {
  final dynamic data;

  ChangeSuccess(this.data);
}

class ChangeError extends ChangeState {
  final String message;

  ChangeError(this.message);
}
