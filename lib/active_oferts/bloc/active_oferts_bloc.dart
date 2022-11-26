import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'active_oferts_event.dart';
part 'active_oferts_state.dart';

class ActiveOfertsBloc extends Bloc<ActiveOfertsEvent, ActiveOfertsState> {
  ActiveOfertsBloc() : super(ActiveOfertsState.initial()) {
    on<ActiveOfertsGet>(_onActiveOfertsGet);
    on<ActiveOfertOfferUser>(_onActiveOfertOfferUser);
  }

  FutureOr<void> _onActiveOfertsGet(
      ActiveOfertsGet event, Emitter<ActiveOfertsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    Uri url = Uri.parse('http://localhost:8080/offersBidder/${email!}');
    final response = await http.get(url);
    final publications = json.decode(response.body);

    if (publications['listOffers'].toString() == '[]') {
      emit(
        state.copyWith(
          status: ActiveOfertsStatus.error,
        ),
      );
    } else {
      emit(
        state.copyWith(
          listOffer: publications['listOffers'],
        ),
      );
    }
  }

  FutureOr<void> _onActiveOfertOfferUser(
      ActiveOfertOfferUser event, Emitter<ActiveOfertsState> emit) async {
    print(event.listOffer);
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    Uri url = Uri.parse('http://localhost:8080/addOffer');

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(event.listOffer));
    final response2 = json.decode(response.body);
    emit(
      state.copyWith(
        status: ActiveOfertsStatus.loaded,
      ),
    );
  }
}
