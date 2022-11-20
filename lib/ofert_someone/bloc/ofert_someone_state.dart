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
    required this.listFiguresAdd,
  });

  OfertSomeoneState.initial()
      : this(
          status: OfertSomeoneStatus.initial,
          idPublication: '',
          listFigures: [{}],
          listFiguresAdd: [],
        );

  final OfertSomeoneStatus status;
  final String idPublication;
  List<dynamic> listFigures;
  List<dynamic> listFiguresAdd;

  OfertSomeoneState copyWith({
    OfertSomeoneStatus? status,
    String? idPublication,
    List<dynamic>? listFigures,
    List<dynamic>? listFiguresAdd,
  }) {
    return OfertSomeoneState(
      status: status ?? this.status,
      idPublication: idPublication ?? this.idPublication,
      listFigures: listFigures ?? this.listFigures,
      listFiguresAdd: listFiguresAdd ?? this.listFiguresAdd,
    );
  }

  @override
  List<Object> get props => [
        status,
        idPublication,
        listFigures,
        listFiguresAdd,
      ];
}
