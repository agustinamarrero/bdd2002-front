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
    on<OfertSomeoneSetId>(_onOfertSomeoneSetId);
    on<OfertSomeoneGetFigures>(_onOfertSomeoneGetFigures);
    on<OfertSomeoneCreate>(_onOfertSomeoneCreate);
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
      final prefs = await SharedPreferences.getInstance();
      final email = prefs.getString('email');
      Uri url = Uri.parse('http://localhost:8080/userFigures/' + email!);
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
      final stateFigure = prefs.getString('stateFigure');
      final description = prefs.getString('description');
      final id = prefs.getString('id');
      final nameUser = prefs.getString('nameUser');

      final createOffer = {
        'id_publication': id,
        'email_bidder': email,
        'state_offer': 'Activo',
        'figures': event.listOffer,
      };
      //   private String number;
      // private String damage_state;
      // private Integer quantity;

      // OFFER
      // private String id_publication;
      // private String email_bidder;
      // private String state_offer;
      // private List<FigureOfferDTO> figures;

      final createPublication = {
        'stateFigure': stateFigure,
        'description': description,
        'id': id,
        'nameUser': nameUser,
      };

      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode(createOffer));
      final response2 = json.decode(response.body);
      if (response2['accepted'] == true) {
        emit(
          state.copyWith(
            status: OfertSomeoneStatus.loaded,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: OfertSomeoneStatus.error,
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
}
