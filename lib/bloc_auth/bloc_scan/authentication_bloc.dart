// authentication_bloc.dart

import 'package:bloc/bloc.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationFingerprintSettingChanged) {
      yield state.copyWith(
        isFingerprintEnabled: event.isFingerprintEnabled,
      );
    } else if (event is AuthenticationLoggedIn) {
      yield AuthenticationSuccess(
          isFingerprintEnabled: state.isFingerprintEnabled);
    }
  }
}
