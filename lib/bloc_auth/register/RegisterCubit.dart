import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../path/pathContact.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  final pathContact contactPath = pathContact();

  void signUp(String username, String userpassword, String employeecode,
      String userfullname) async {
    emit(SignUpLoading());

    final response = await http.post(
      Uri.parse(contactPath.getRepoPathSignUP()),
      body: {
        'username': username,
        'userpassword': userpassword,
        'employeecode': employeecode,
        'userfullname': userfullname
      },
    );

    if (response.statusCode == 200) {
      // final data = jsonDecode(response.body);
      try {
        // final data = jsonDecode(response.body);
        emit(SignUpSuccess(response.body));
      } catch (e) {
        if (e is FormatException) {
          print('Invalid JSON data: ${e.message}');
        } else {
          print('Error decoding JSON data: $e');
        }
      }

      // emit(SignUpSuccess(data));
    } else {
      final errorMessage = response.reasonPhrase ?? 'An error occurred';
      emit(SignUpError(errorMessage));
    }
  }
}

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final dynamic data;

  SignUpSuccess(this.data);
}

class SignUpError extends SignUpState {
  final String message;

  SignUpError(this.message);
}
