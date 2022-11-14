part of 'upload_figurita_bloc.dart';

abstract class UploadFiguritaEvent extends Equatable {
  const UploadFiguritaEvent();
}

class UploadFiguritaStateFigure extends UploadFiguritaEvent {
  const UploadFiguritaStateFigure(this.stateFigure);

  final EstadoFigurita stateFigure;
  @override
  List<Object?> get props => [stateFigure];
}

class UploadFiguritaNumberPlayer extends UploadFiguritaEvent {
  const UploadFiguritaNumberPlayer(this.numberPlayer);

  final String numberPlayer;
  @override
  List<Object?> get props => [numberPlayer];
}

class UploadFiguritaSubmited extends UploadFiguritaEvent {
  const UploadFiguritaSubmited();

  @override
  List<Object?> get props => [];
}
