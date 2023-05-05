import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String userpassword;

  LoginButtonPressed({required this.username, required this.userpassword});

  @override
  List<Object> get props => [username, userpassword];

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'userpassword': userpassword,
    };
  }
}

class SomeEvent extends LoginEvent {}

class AnotherEvent extends LoginEvent {}
