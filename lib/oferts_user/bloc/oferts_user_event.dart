part of 'oferts_user_bloc.dart';

abstract class OfertsUserEvent extends Equatable {
  const OfertsUserEvent();
}

class OfertsUserGet extends OfertsUserEvent {
  const OfertsUserGet({required this.idOffer});

  final String idOffer;
  @override
  List<Object?> get props => [idOffer];
}

class OfertsUserAccepted extends OfertsUserEvent {
  const OfertsUserAccepted({required this.idPublication});
  final int idPublication;
  @override
  List<Object?> get props => [idPublication];
}

class OfertsUserRejected extends OfertsUserEvent {
  const OfertsUserRejected({required this.idPublication});

  final int idPublication;
  @override
  List<Object?> get props => [idPublication];
}
