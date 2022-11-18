import 'dart:async';
import 'dart:convert';

import 'package:bdd2022/login/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState.initial()) {
    on<LoginLastnameChanged>(_onLoginLastnameChanged);
    on<LoginPhoneChanged>(_onLoginPhoneChanged);
    on<LoginEmailChanged>(_onLoginEmailChanged);
    on<LoginCiChanged>(_onLoginCiChanged);
    on<LoginNameChanged>(_onLoginNameChanged);
    on<LoginPasswordChanged>(_onLoginPasswordChanged);
    on<LoginFormSubmited>(_onLoginFormSubmited);
  }

  FutureOr<void> _onLoginLastnameChanged(
      LoginLastnameChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        lastname: event.lastname,
      ),
    );
  }

  FutureOr<void> _onLoginPhoneChanged(
      LoginPhoneChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        phone: event.phone,
      ),
    );
  }

  FutureOr<void> _onLoginEmailChanged(
      LoginEmailChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        email: event.email,
      ),
    );
  }

  FutureOr<void> _onLoginCiChanged(
      LoginCiChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        ci: event.ci,
      ),
    );
  }

  FutureOr<void> _onLoginNameChanged(
      LoginNameChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        name: event.name,
      ),
    );
  }

  FutureOr<void> _onLoginPasswordChanged(
      LoginPasswordChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }

  FutureOr<void> _onLoginFormSubmited(
      LoginFormSubmited event, Emitter<LoginState> emit) async {
    User newUser = User(state.name, state.email, state.ci, state.lastname,
        state.phone, state.password);
    try {
      Uri url = Uri.parse('http://localhost:8080/addUser');
      final prefs = await SharedPreferences.getInstance();
      var body = newUser.toJson();
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode(body));

      final response2 = json.decode(response.body);
      if (response2['accepted'] == true) {
        prefs.setString('email', state.email);
        emit(
          state.copyWith(
            status: LoginStatus.loaded,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: LoginStatus.error,
        ),
      );
    }
  }
}
