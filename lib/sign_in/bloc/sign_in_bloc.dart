import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState.initial()) {
    on<SignInEmailChanged>(_onLSignInEmailChanged);
    on<SignInPasswordChanged>(_onSignInPasswordChanged);
    on<SignInFormSubmited>(_onLSignInFormSubmited);
  }

  FutureOr<void> _onLSignInEmailChanged(
      SignInEmailChanged event, Emitter<SignInState> emit) {
    emit(
      state.copyWith(
        email: event.email,
      ),
    );
  }

  FutureOr<void> _onSignInPasswordChanged(
      SignInPasswordChanged event, Emitter<SignInState> emit) {
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }

  FutureOr<void> _onLSignInFormSubmited(
      SignInFormSubmited event, Emitter<SignInState> emit) async {
    Map<String, dynamic> user = {
      'email': state.email,
      'password': state.password,
    };
    try {
      Uri url = Uri.parse('http://localhost:8080/loginUser');
      final response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode(user));
      emit(
        state.copyWith(
          status: SignInStatus.loaded,
        ),
      );
      final prefs = await SharedPreferences.getInstance();
      final response2 = json.decode(response.body);

      prefs.setString('email', state.email);
      emit(
        state.copyWith(
          status: SignInStatus.loaded,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: SignInStatus.error,
        ),
      );
    }
  }
}
