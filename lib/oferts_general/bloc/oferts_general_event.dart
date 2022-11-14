part of 'oferts_general_bloc.dart';

abstract class OfertsGeneralEvent extends Equatable {
  const OfertsGeneralEvent();
}

class OfertsGeneralGet extends OfertsGeneralEvent {
  const OfertsGeneralGet();

  @override
  List<Object?> get props => [];
}

class OfertsGeneralSubmited extends OfertsGeneralEvent {
  const OfertsGeneralSubmited(
    this.id,
    this.stateFigure,
    this.nameUser,
    this.description,
  );

  final String stateFigure;
  final String description;
  final String nameUser;
  final String id;

  @override
  List<Object?> get props => [
        stateFigure,
        nameUser,
        description,
        id,
      ];
}
