import 'dart:async';
import 'dart:convert';

import 'package:bdd2022/models/figure.dart';
import 'package:bdd2022/upload_figurita/upload_figurita.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'upload_figurita_event.dart';
part 'upload_figurita_state.dart';

class UploadFiguritaBloc
    extends Bloc<UploadFiguritaEvent, UploadFiguritaState> {
  UploadFiguritaBloc() : super(UploadFiguritaState.initial()) {
    on<UploadFiguritaStateFigure>(_onUploadFiguritaStateFigure);
    on<UploadFiguritaNumberPlayer>(_onUploadFiguritaNumberPlayer);
    on<UploadFiguritaSubmited>(_onUploadFiguritaSubmited);
  }

  FutureOr<void> _onUploadFiguritaStateFigure(
      UploadFiguritaStateFigure event, Emitter<UploadFiguritaState> emit) {
    emit(
      state.copyWith(
        stateFigure: event.stateFigure,
      ),
    );
  }

  FutureOr<void> _onUploadFiguritaNumberPlayer(
      UploadFiguritaNumberPlayer event, Emitter<UploadFiguritaState> emit) {
    emit(
      state.copyWith(
        numberPlayer: event.numberPlayer,
      ),
    );
  }

  FutureOr<void> _onUploadFiguritaSubmited(
      UploadFiguritaSubmited event, Emitter<UploadFiguritaState> emit) async {
    Figure figure = Figure(state.numberPlayer, state.stateFigure);
    try {
      Uri url = Uri.parse('http://localhost:8080/createFigure');

      var body = figure.toJson();
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode(body));
      //Si todo ok --> Mandar msj ok y redireccionarlo.
      emit(
        state.copyWith(
          status: UploadFiguritaStatus.loaded,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: UploadFiguritaStatus.error,
        ),
      );
    }
  }
}
