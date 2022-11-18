import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'oferts_general_event.dart';
part 'oferts_general_state.dart';

class OfertsGeneralBloc extends Bloc<OfertsGeneralEvent, OfertsGeneralState> {
  OfertsGeneralBloc() : super(const OfertsGeneralState.initial()) {
    on<OfertsGeneralGet>(_onOfertsGeneralGet);
    on<OfertsGeneralSubmited>(_onOfertsGeneralSubmited);
  }

  //Ejecutar para obtener toda la lista de ofertas
  FutureOr<void> _onOfertsGeneralGet(
      OfertsGeneralGet event, Emitter<OfertsGeneralState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    Uri url = Uri.parse('http://localhost:8080/publications/' + email!);
    final response = await http.get(url);
    final oferts = json.decode(response.body);
    if (oferts == []) {
      emit(
        state.copyWith(
          listOferts: oferts,
          status: OfertsGeneralStatus.error,
        ),
      );
    } else {
      emit(
        state.copyWith(
          listOferts: oferts,
          status: OfertsGeneralStatus.loaded,
        ),
      );
    }
  }

  FutureOr<void> _onOfertsGeneralSubmited(
      OfertsGeneralSubmited event, Emitter<OfertsGeneralState> emit) async {
    // Map<String, dynamic> user = {
    //   'namePlayer': event.namePlayer,
    //   'stateFigure': event.statePlayer,
    //   'nameUser': event.nameUser,
    //   'idOferta': event.id,
    // };
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('description', event.description);
      await prefs.setString('stateFigure', event.stateFigure);
      await prefs.setString('nameUser', event.nameUser);
      await prefs.setString('id', event.id);

      // Uri url = Uri.parse('http://localhost:8080/users');
      // var response = await http.post(url,
      //     headers: {"Content-Type": "application/json"},
      //     body: json.encode(user));
      // emit(
      //   state.copyWith(
      //     status: OfertsGeneralStatus.loaded,
      //   ),
      // );
      //Si todo ok --> Mandar msj ok y redireccionarlo.
    } catch (e) {
      emit(
        state.copyWith(
          status: OfertsGeneralStatus.error,
        ),
      );
    }
  }
}
