import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'LoginEvent.dart';
import 'LoginState.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final http.Client httpClient;
  final BuildContext context;

  LoginBloc({required this.httpClient, required this.context})
      : super(LoginInitial()) {
    on<LoginButtonPressed>(_handleLoginButtonPressed);
  }

  void _handleLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    try {
      final response = await httpClient.post(
        Uri.parse('https://souvanny.la/costing/CostingAPI/iLogin'),
        body: event.toJson(),
      );
      if (response.statusCode == 200) {
        emit(LoginSuccess(succcess: 'Successfully login'));
      } else {
        emit(LoginFailure(error: 'An error occurred'));
      }
    } catch (error) {
      emit(LoginFailure(error: 'An error occurred'));
    }
  }
}

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   final http.Client httpClient;
//   final BuildContext context;

//   LoginBloc({required this.httpClient, required this.context})
//       : super(LoginInitial());

//   @override
//   Stream<LoginState> mapEventToState(
//     LoginEvent event,
//   ) async* {
//     if (event is LoginButtonPressed) {
//       yield LoginLoading();
//       try {
//         // final response = await httpClient.post(
//         //   'https://souvanny.la/costing/CostingAPI/iLogin',
//         //   body: {
//         //     'email': event.username,
//         //     'password': event.userpassword,
//         //   },
//         // );
//         final response = await httpClient.post(
//           Uri.parse('https://souvanny.la/costing/CostingAPI/iLogin'),
//           body: {
//             'username': event.username,
//             'userpassword': event.userpassword,
//           },
//         );
//         if (response.statusCode == 200) {
//           yield LoginSuccess(succcess: 'successfully');
//         } else {
//           yield LoginFailure(error: 'Invalid email or password');
//         }
//       } catch (error) {
//         yield LoginFailure(error: error.toString());
//       }
//     }
//   }
// }
