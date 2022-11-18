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
  ActivePublicationsBloc() : super(const ActivePublicationsState.initial()) {
    on<ActivePublicationsGet>(_onActivePublicationsGet);
    on<ActivePublicationsStateChanged>(_onActivePublicationsStateChanged);
  }

  //Ejecutar para obtener toda la lista de publicaciones
  FutureOr<void> _onActivePublicationsGet(ActivePublicationsGet event,
      Emitter<ActivePublicationsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    Uri url = Uri.parse('http://localhost:8080/publicationsGet${email!}');
    final response = await http.get(url);

    final publications = json.decode(response.body);
    if (publications == []) {
      emit(
        state.copyWith(
          listPublications: publications,
          status: ActivePublicationsStatus.error,
        ),
      );
    } else {
      emit(
        state.copyWith(
          listPublications: publications,
          status: ActivePublicationsStatus.loaded,
        ),
      );
    }
  }

  FutureOr<void> _onActivePublicationsStateChanged(
      ActivePublicationsStateChanged event,
      Emitter<ActivePublicationsState> emit) async {
    try {
      Publication publication = Publication(event.publication.namePlayer,
          event.publication.statePublication, event.publication.id);

      Uri url = Uri.parse('http://localhost:8080/editPublication');

      var body = publication.toJson();
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode(body));
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

    //Si todo ok --> Mandar msj ok y redireccionarlo.
  }
}
