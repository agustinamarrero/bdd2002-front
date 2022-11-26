part of 'select_figures_bloc.dart';

enum SelectFiguresStatus {
  initial,
  loading,
  loaded,
  error,
}

class SelectFiguresState extends Equatable {
  SelectFiguresState({
    required this.status,
    required this.listFigures,
    required this.listFiguresAdd,
  });

  SelectFiguresState.initial()
      : this(
          status: SelectFiguresStatus.initial,
          listFigures: [{}],
          listFiguresAdd: [],
        );

  final SelectFiguresStatus status;
  List<dynamic> listFigures;
  List<dynamic> listFiguresAdd;

  SelectFiguresState copyWith({
    SelectFiguresStatus? status,
    List<dynamic>? listFigures,
    List<dynamic>? listFiguresAdd,
  }) {
    return SelectFiguresState(
      status: status ?? this.status,
      listFigures: listFigures ?? this.listFigures,
      listFiguresAdd: listFiguresAdd ?? this.listFiguresAdd,
    );
  }

  @override
  List<Object> get props => [
        status,
        listFigures,
        listFiguresAdd,
      ];
}
