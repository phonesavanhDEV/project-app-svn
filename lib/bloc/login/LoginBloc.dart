import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'LoginEvent.dart';
import 'LoginState.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Dio dio;
  final BuildContext context;

  LoginBloc({required this.dio, required this.context})
      : super(LoginInitial()) {
    on<LoginButtonPressed>(_handleLoginButtonPressed);
    on<SomeEvent>(_handleSomeEvent);
    on<AnotherEvent>(_handleAnotherEvent);
  }

  void _handleLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    try {
      final response = await dio.post(
        'http://165.22.51.189:3000/users/login',
        data: event.toJson(),
      );

      // Handle successful login response
      emit(LoginSuccess());
    } on DioError catch (error) {
      String errorMessage = 'An error occurred';

      if (error.response != null) {
        errorMessage = error.response!.data['message'];
      }

      emit(LoginFailure(error: errorMessage));
    }
  }

  void _handleSomeEvent(SomeEvent event, Emitter<LoginState> emit) {
    // Handle the event and emit new states as needed
  }

  void _handleAnotherEvent(AnotherEvent event, Emitter<LoginState> emit) {
    // Handle the event and emit new states as needed
  }
}
