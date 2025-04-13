import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(/*{required this.authRepository}*/) : super(AuthInitial()) {
    on<AddEmail>(_addEmail);
    on<AddPassword>(_addPassword);
  }

  //final IAuthRepository authRepository;

  FutureOr<void> _addEmail(AddEmail event, Emitter<AuthState> emit) {}

  FutureOr<void> _addPassword(AddPassword event, Emitter<AuthState> emit) {}
}
