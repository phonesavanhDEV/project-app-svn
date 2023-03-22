// authentication_event.dart

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationFingerprintSettingChanged extends AuthenticationEvent {
  const AuthenticationFingerprintSettingChanged({
    required this.isFingerprintEnabled,
  });

  final bool isFingerprintEnabled;

  @override
  List<Object> get props => [isFingerprintEnabled];
}

class AuthenticationLoggedIn extends AuthenticationEvent {}
