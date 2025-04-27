part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthAddCode extends AuthEvent {
  AuthAddCode({
    required this.code,
  });
  final String code;
}

class AuthMeeting extends AuthEvent {
  final String firstName;
  final String lastName;
  final bool isMan;

  AuthMeeting(
      {required this.firstName, required this.lastName, required this.isMan});
}

class AuthTryLogin extends AuthEvent {
  final String email;
  final String password;

  AuthTryLogin({required this.email, required this.password});
}

class AuthTryRegister extends AuthEvent {
  final String email;
  final String password;
  final String confPass;
  AuthTryRegister(
      {required this.email, required this.password, required this.confPass});
}
