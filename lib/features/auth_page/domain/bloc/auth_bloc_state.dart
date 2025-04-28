part of 'auth_bloc.dart';

class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AlreadyLogined extends AuthState {}

class Sucsess extends AuthState {}

class AuthError extends AuthState {
  AuthError({required this.error});
  final String error;
}
