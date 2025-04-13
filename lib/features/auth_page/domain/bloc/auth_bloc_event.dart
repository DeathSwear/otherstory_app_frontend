part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AddEmail extends AuthEvent {
  AddEmail({required this.email, required this.isNewAccount});
  final String email;
  bool isNewAccount;
}

class AddPassword extends AuthEvent {
  AddPassword({
    required this.password,
  });
  final String password;
}
