import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
part 'active_oferts_event.dart';
part 'active_oferts_state.dart';

class ActiveOfertsBloc extends Bloc<ActiveOfertsEvent, ActiveOfertsState> {
  ActiveOfertsBloc() : super(ActiveOfertsState.initial()) {
    on<ActiveOfertsGet>(_onActiveOfertsGet);
  }

  FutureOr<void> _onActiveOfertsGet(
      ActiveOfertsGet event, Emitter<ActiveOfertsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    Uri url = Uri.parse('http://localhost:8080/offersBidder/${email!}');
    final response = await http.get(url);
    final publications = json.decode(response.body);

    if (publications.toString() == '[]') {
      emit(
        state.copyWith(
          status: ActiveOfertsStatus.error,
        ),
      );
    } else {
      emit(
        state.copyWith(
          listOffer: publications,
          status: ActiveOfertsStatus.loaded,
        ),
      );
    }
  }
}
