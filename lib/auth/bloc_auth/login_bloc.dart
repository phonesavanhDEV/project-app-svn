import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svn_costing_profit/auth/repository/user_repository.dart';

import '../models/user_model.dart';

import '../services/authentication_service.dart';

import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiService apiService;
  final User currentUser;
  final UserRepository userRepository;

  LoginBloc({
    required this.apiService,
    required this.currentUser,
    required this.userRepository,
  }) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        final user = await userRepository.login(
            email: event.email, password: event.password);
        if (user != null) {
          currentUser.update(user);
          yield LoginSuccess();
        } else {
          yield LoginFailure(error: "Invalid email or password");
        }
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
