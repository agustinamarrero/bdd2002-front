part of 'active_oferts_bloc.dart';

abstract class ActiveOfertsEvent extends Equatable {
  const ActiveOfertsEvent();
}

class ActiveOfertsGet extends ActiveOfertsEvent {
  const ActiveOfertsGet();

  @override
  List<Object?> get props => [];
}
