part of 'select_figures_bloc.dart';

abstract class SelectFiguresEvent extends Equatable {
  const SelectFiguresEvent();
}

class SelectFiguresGetFigures extends SelectFiguresEvent {
  const SelectFiguresGetFigures();

  @override
  List<Object?> get props => [];
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
