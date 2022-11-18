import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'oferts_user_event.dart';
part 'oferts_user_state.dart';

class OfertsUserBloc extends Bloc<OfertsUserEvent, OfertsUserState> {
  OfertsUserBloc() : super(OfertsUserState.initial()) {
    on<OfertsUserGet>(_onOfertsUserGet);
  }

  FutureOr<void> _onOfertsUserGet(
      OfertsUserGet event, Emitter<OfertsUserState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    Uri url = Uri.parse('http://localhost:8080/publicationsmy/${email!}');
    final response = await http.get(url);
    final oferts = json.decode(response.body);
    if (oferts == []) {
      emit(
        state.copyWith(
          listOferts: oferts,
          status: OfertsUserStatus.error,
        ),
      );
    } else {
      emit(
        state.copyWith(
          listOferts: oferts,
          status: OfertsUserStatus.loaded,
        ),
      );
    }
  }
}
