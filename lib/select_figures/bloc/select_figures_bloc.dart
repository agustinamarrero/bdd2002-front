import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'select_figures_event.dart';
part 'select_figures_state.dart';

class SelectFiguresBloc extends Bloc<SelectFiguresEvent, SelectFiguresState> {
  SelectFiguresBloc({required this.listPublications})
      : super(SelectFiguresState.initial()) {
    on<SelectFiguresGetFigures>(_onOfertSomeoneGetFigures);
    on<SelectFiguresCreate>(_onSelectFiguresCreate);
  }

  final List listPublications;

  FutureOr<void> _onOfertSomeoneGetFigures(
      SelectFiguresGetFigures event, Emitter<SelectFiguresState> emit) async {
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
            status: SelectFiguresStatus.error,
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
          status: SelectFiguresStatus.error,
        ),
      );
    }
  }

  FutureOr<void> _onSelectFiguresCreate(
      SelectFiguresCreate event, Emitter<SelectFiguresState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    Uri url = Uri.parse('http://localhost:8080/addOffer');

    final id = prefs.getString('id');
    state.listFiguresAdd.remove('head');
    listPublications.remove('publication_description');
    listPublications.remove('state_offer');
    final createOffer = {
      'email_bidder': email,
      'state_offer': 'Contraoferta',
      'figures': state.listFiguresAdd,
    };

    //createOffer.addAll(listPublications);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(createOffer));
    final response2 = json.decode(response.body);
    emit(
      state.copyWith(
        status: SelectFiguresStatus.loaded,
      ),
    );
  }
}
