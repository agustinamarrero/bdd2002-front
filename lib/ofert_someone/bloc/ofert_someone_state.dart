part of 'ofert_someone_bloc.dart';

enum OfertSomeoneStatus {
  initial,
  loading,
  loaded,
  error,
}

class OfertSomeoneState extends Equatable {
  OfertSomeoneState({
    required this.status,
    required this.idPublication,
    required this.listFigures,
  });

  OfertSomeoneState.initial()
      : this(
          status: OfertSomeoneStatus.initial,
          idPublication: '',
          listFigures: [{}],
        );

  final OfertSomeoneStatus status;
  final String idPublication;
  List<dynamic> listFigures;

  OfertSomeoneState copyWith({
    OfertSomeoneStatus? status,
    String? idPublication,
    List<dynamic>? listFigures,
  }) {
    return OfertSomeoneState(
      status: status ?? this.status,
      idPublication: idPublication ?? this.idPublication,
      listFigures: listFigures ?? this.listFigures,
    );
  }

  @override
  List<Object> get props => [
        status,
        idPublication,
        listFigures,
      ];
}
