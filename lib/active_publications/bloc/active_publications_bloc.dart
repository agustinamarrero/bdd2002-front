import 'dart:async';
import 'dart:convert';

import 'package:bdd2022/models/publication.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'active_publications_event.dart';
part 'active_publications_state.dart';

class ActivePublicationsBloc
    extends Bloc<ActivePublicationsEvent, ActivePublicationsState> {
  ActivePublicationsBloc() : super(ActivePublicationsState.initial()) {
    on<ActivePublicationsGet>(_onActivePublicationsGet);
    on<ActivePublicationsStateChanged>(_onActivePublicationsStateChanged);
  }

  FutureOr<void> _onActivePublicationsGet(ActivePublicationsGet event,
      Emitter<ActivePublicationsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    Uri url = Uri.parse('http://localhost:8080/mypublications/${email!}');
    final response = await http.get(url);

    final publications = json.decode(response.body);
    if (publications == []) {
      emit(
        state.copyWith(
          listPublications: publications['publications'],
          status: ActivePublicationsStatus.error,
        ),
      );
    } else {
      emit(
        state.copyWith(
          listPublications: publications['publications'],
        ),
      );
    }
  }

  FutureOr<void> _onActivePublicationsStateChanged(
      ActivePublicationsStateChanged event,
      Emitter<ActivePublicationsState> emit) async {
    try {
      final publication = {
        'publication_id': int.parse(event.publication.id),
        'activate': event.publication.statePublication == 'f' ? true : false,
      };
      Uri url = Uri.parse('http://localhost:8080/activate');

      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode(publication));
      emit(
        state.copyWith(
          status: ActivePublicationsStatus.loaded,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ActivePublicationsStatus.error,
        ),
      );
    }
  }
}
