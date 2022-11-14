part of 'upload_figurita_bloc.dart';

enum UploadFiguritaStatus {
  initial,
  loading,
  loaded,
  error,
}

class UploadFiguritaState extends Equatable {
  const UploadFiguritaState({
    required this.status,
    required this.numberPlayer,
    required this.stateFigure,
    required this.figure,
  });

  UploadFiguritaState.initial()
      : this(
          status: UploadFiguritaStatus.initial,
          numberPlayer: '',
          stateFigure: EstadoFigurita.bueno,
          figure: Figure('', EstadoFigurita.bueno),
        );

  final UploadFiguritaStatus status;
  final String numberPlayer;
  final EstadoFigurita stateFigure;
  final Figure figure;

  UploadFiguritaState copyWith({
    UploadFiguritaStatus? status,
    String? numberPlayer,
    EstadoFigurita? stateFigure,
    Figure? figure,
  }) {
    return UploadFiguritaState(
      status: status ?? this.status,
      numberPlayer: numberPlayer ?? this.numberPlayer,
      stateFigure: stateFigure ?? this.stateFigure,
      figure: figure ?? this.figure,
    );
  }

  @override
  List<Object> get props => [
        status,
        numberPlayer,
        stateFigure,
        figure,
      ];
}
