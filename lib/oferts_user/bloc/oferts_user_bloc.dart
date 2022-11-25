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
    on<OfertsUserAccepted>(_oOfertsUserAccepted);
    on<OfertsUserRejected>(_onOfertsUserRejected);
  }

  FutureOr<void> _onOfertsUserGet(
      OfertsUserGet event, Emitter<OfertsUserState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    Uri url = Uri.parse(
        'http://localhost:8080/offersPublication/${email!}/' + event.idOffer);

    emit(
      state.copyWith(
        idOffer: event.idOffer,
      ),
    );
    final response = await http.get(url);
    final oferts = json.decode(response.body);

    if (oferts['listOffers'] == []) {
      emit(
        state.copyWith(
          listOferts: oferts['listOffers'],
          status: OfertsUserStatus.error,
        ),
      );
    } else {
      emit(
        state.copyWith(
          listOferts: oferts['listOffers'],
          status: OfertsUserStatus.initial,
        ),
      );
    }
  }

  FutureOr<void> _onOfertsUserRejected(
      OfertsUserRejected event, Emitter<OfertsUserState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    Uri url = Uri.parse(
        'http://localhost:8080/rejectOffer/' + event.idPublication.toString());
    final response = await http.put(url);
    final reject = json.decode(response.body);
  }

  FutureOr<void> _oOfertsUserAccepted(
      OfertsUserAccepted event, Emitter<OfertsUserState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    Uri url = Uri.parse(
        'http://localhost:8080/acceptOffer/' + event.idPublication.toString());
    final response = await http.put(url);
    final reject = json.decode(response.body);
  }
}
