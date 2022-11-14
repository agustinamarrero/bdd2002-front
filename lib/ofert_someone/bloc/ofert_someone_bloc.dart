import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'ofert_someone_event.dart';
part 'ofert_someone_state.dart';

class OfertSomeoneBloc extends Bloc<OfertSomeoneEvent, OfertSomeoneState> {
  OfertSomeoneBloc() : super(const OfertSomeoneState.initial()) {
    on<OfertSomeoneSetId>(_onOfertSomeoneSetId);
    on<OfertSomeoneGetFigures>(_onOfertSomeoneGetFigures);
  }

  FutureOr<void> _onOfertSomeoneSetId(
      OfertSomeoneSetId event, Emitter<OfertSomeoneState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final description = prefs.getString('description');
    final stateFigure = prefs.getString('stateFigure');
    final nameUser = prefs.getString('nameUser');
    final id = prefs.getString('id');
    print(id);
    print(stateFigure);
    print(description);
    print(nameUser);
    emit(
      state.copyWith(
          // idPublication: idPublication,
          ),
    );
    print(state.idPublication);
  }

  FutureOr<void> _onOfertSomeoneGetFigures(
      OfertSomeoneGetFigures event, Emitter<OfertSomeoneState> emit) async {
    try {
      Uri url = Uri.parse('http://localhost:8080/userFigures/agMail');
      final response = await http.get(url);
      final figures = json.decode(response.body);
      print(figures);
    } catch (e) {}
  }
}
