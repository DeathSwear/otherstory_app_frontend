import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(/*{required this.authRepository}*/) : super(AuthInitial()) {
    on<AuthAddCode>(_enterCode);
    on<AuthMeeting>(_addMeeting);
    on<AuthTryLogin>(_tryLogin);
    on<AuthTryRegister>(_tryRegister);
  }

  //final IAuthRepository authRepository;

  FutureOr<void> _enterCode(AuthAddCode event, Emitter<AuthState> emit) {
    emit(Sucsess());
  }

  FutureOr<void> _addMeeting(AuthMeeting event, Emitter<AuthState> emit) {
    emit(Sucsess());
  }

  FutureOr<void> _tryLogin(AuthTryLogin event, Emitter<AuthState> emit) {
    emit(Sucsess());
  }

  FutureOr<void> _tryRegister(AuthTryRegister event, Emitter<AuthState> emit) {
    emit(Sucsess());
  }
}
