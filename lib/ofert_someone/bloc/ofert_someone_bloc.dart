import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'ofert_someone_event.dart';
part 'ofert_someone_state.dart';

class OfertSomeoneBloc extends Bloc<OfertSomeoneEvent, OfertSomeoneState> {
  OfertSomeoneBloc() : super(OfertSomeoneState.initial()) {
    on<OfertSomeoneGetFigures>(_onOfertSomeoneGetFigures);
    on<OfertSomeoneCreate>(_onOfertSomeoneCreate);
    on<OfertSomeoneChanged>(_onOfertSomeoneChanged);
  }

  FutureOr<void> _onOfertSomeoneGetFigures(
      OfertSomeoneGetFigures event, Emitter<OfertSomeoneState> emit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final email = prefs.getString('email');
      Uri url = Uri.parse('http://localhost:8080/userFigures/${email!}');
      final response = await http.get(url);
      final figures = json.decode(response.body);
      if (figures['userfigures'].toString() == '[]') {
        emit(
          state.copyWith(
            listFigures: figures['userfigures'],
            status: OfertSomeoneStatus.error,
          ),
        );
      } else {
        emit(
          state.copyWith(
            listFigures: figures['userfigures'],
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: OfertSomeoneStatus.error,
        ),
      );
    }
  }

  FutureOr<void> _onOfertSomeoneCreate(
      OfertSomeoneCreate event, Emitter<OfertSomeoneState> emit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final email = prefs.getString('email');
      Uri url = Uri.parse('http://localhost:8080/addOffer');

      final id = prefs.getString('id');
      state.listFiguresAdd.remove('head');
      final createOffer = {
        'id_publication': id,
        'email_bidder': email,
        'state_offer': 'Activo',
        'figures': state.listFiguresAdd,
      };

      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode(createOffer));
      final response2 = json.decode(response.body);

      emit(
        state.copyWith(
          status: OfertSomeoneStatus.loaded,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: OfertSomeoneStatus.error,
        ),
      );
    }
  }

  FutureOr<void> _onOfertSomeoneChanged(
      OfertSomeoneChanged event, Emitter<OfertSomeoneState> emit) {
    final aux = state.listFiguresAdd;
    aux.add(event.list);

    emit(
      state.copyWith(listFiguresAdd: aux),
    );
  }
}
