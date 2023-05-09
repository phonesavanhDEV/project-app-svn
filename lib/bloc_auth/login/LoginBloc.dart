import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../path/pathContact.dart';
import 'LoginEvent.dart';
import 'LoginState.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final http.Client httpClient;
  final BuildContext context;
  final pathContact contactPath = pathContact();

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
        Uri.parse(contactPath.getRepoPathLogin()),
        body: event.toJson(),
      );
      if (response.statusCode == 200) {
        emit(LoginSuccess(success: 'Successfully login'));
      } else {
        emit(LoginFailure(error: 'An error occurred'));
      }
    } catch (error) {
      emit(LoginFailure(error: 'An error occurred'));
    }
  }
}
