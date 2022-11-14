import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'create_publication_event.dart';
part 'create_publication_state.dart';

class CreatePublicationBloc
    extends Bloc<CreatePublicationEvent, CreatePublicationState> {
  CreatePublicationBloc() : super(const CreatePublicationState.initial()) {
    on<CreatePublicationSubmited>(_onCreatePublicationSubmited);
  }

  FutureOr<void> _onCreatePublicationSubmited(CreatePublicationSubmited event,
      Emitter<CreatePublicationState> emit) async {
    try {
      Uri url = Uri.parse('http://localhost:8080/createFigure');
      final createPublication = {
        'id': event.id,
        'namePlayer': event.namePlayer,
      };

      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode(createPublication));
      //Si todo ok --> Mandar msj ok y redireccionarlo.
      emit(
        state.copyWith(
          status: CreatePublicationStatus.loaded,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: CreatePublicationStatus.error,
        ),
      );
    }
  }
}
