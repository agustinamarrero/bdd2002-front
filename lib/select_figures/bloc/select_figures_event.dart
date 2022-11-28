part of 'select_figures_bloc.dart';

abstract class SelectFiguresEvent extends Equatable {
  const SelectFiguresEvent();
}

class SelectFiguresGetFigures extends SelectFiguresEvent {
  const SelectFiguresGetFigures();

  @override
  List<Object?> get props => [];
}

class SelectFiguresChanged extends SelectFiguresEvent {
  const SelectFiguresChanged(this.list);
  final Map<String, dynamic> list;
  @override
  List<Object?> get props => [list];
}

class SelectFiguresCreate extends SelectFiguresEvent {
  const SelectFiguresCreate({
    required this.listOffer,
  });

  final List<dynamic> listOffer;
  @override
  List<Object?> get props => [
        listOffer,
      ];
}
