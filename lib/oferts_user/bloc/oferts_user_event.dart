part of 'oferts_user_bloc.dart';

abstract class OfertsUserEvent extends Equatable {
  const OfertsUserEvent();
}

class OfertsUserGet extends OfertsUserEvent {
  const OfertsUserGet();

  @override
  List<Object?> get props => [];
}
