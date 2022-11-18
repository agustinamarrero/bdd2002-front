import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/ofert.dart';

part 'create_publication_event.dart';
part 'create_publication_state.dart';

class CreatePublicationBloc
    extends Bloc<CreatePublicationEvent, CreatePublicationState> {
  CreatePublicationBloc() : super(CreatePublicationState.initial()) {
    on<CreatePublicationSubmited>(_onCreatePublicationSubmited);
    on<CreatePublicationsGetFigurita>(_onCreatePublicationsGetFigurita);
  }

  FutureOr<void> _onCreatePublicationSubmited(CreatePublicationSubmited event,
      Emitter<CreatePublicationState> emit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final email = prefs.getString('email');
      Uri url = Uri.parse('http://localhost:8080/addPublication');
      final createPublication = {
        'publication_id': event.id,
        'email': email,
      };

      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode(createPublication));
      final response2 = json.decode(response.body);
      // if (response2['accepted'] == true) {

      // } else {
      //   emit(
      //     state.copyWith(
      //       status: CreatePublicationStatus.error,
      //     ),
      //   );
      // }
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

  FutureOr<void> _onCreatePublicationsGetFigurita(
      CreatePublicationsGetFigurita event,
      Emitter<CreatePublicationState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    Uri url = Uri.parse('http://localhost:8080/userFigures/${email!}');
    final response = await http.get(url);
    final figures = json.decode(response.body);
    //final figures2 = Oferts.fromJson(figures['userfigures']);
    print(figures['userfigures']);

    if (figures == []) {
      emit(
        state.copyWith(
          listFigures: figures['userfigures'],
          status: CreatePublicationStatus.error,
        ),
      );
    } else {
      emit(
        state.copyWith(
          listFigures: figures['userfigures'],
          status: CreatePublicationStatus.loaded,
        ),
      );
    }
  }
}
