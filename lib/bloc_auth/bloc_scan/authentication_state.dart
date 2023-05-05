// authentication_state.dart

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState({required this.isFingerprintEnabled});

  final bool isFingerprintEnabled;

  @override
  List<Object> get props => [isFingerprintEnabled];

  AuthenticationState copyWith({bool? isFingerprintEnabled});
}

class AuthenticationInitial extends AuthenticationState {
  const AuthenticationInitial() : super(isFingerprintEnabled: false);

  @override
  AuthenticationState copyWith({bool? isFingerprintEnabled}) {
    return AuthenticationInitial();
  }
}

class AuthenticationSuccess extends AuthenticationState {
  const AuthenticationSuccess({required bool isFingerprintEnabled})
      : super(isFingerprintEnabled: isFingerprintEnabled);

  @override
  AuthenticationState copyWith({bool? isFingerprintEnabled}) {
    return AuthenticationSuccess(
      isFingerprintEnabled: isFingerprintEnabled ?? this.isFingerprintEnabled,
    );
  }
}
