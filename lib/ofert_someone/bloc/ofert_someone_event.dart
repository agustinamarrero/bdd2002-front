part of 'ofert_someone_bloc.dart';

abstract class OfertSomeoneEvent extends Equatable {
  const OfertSomeoneEvent();
}

class OfertSomeoneSetId extends OfertSomeoneEvent {
  const OfertSomeoneSetId();

  @override
  List<Object?> get props => [];
}

class OfertSomeoneGetFigures extends OfertSomeoneEvent {
  const OfertSomeoneGetFigures();

  @override
  List<Object?> get props => [];
}

class OfertSomeoneChanged extends OfertSomeoneEvent {
  const OfertSomeoneChanged(this.list);

  final Map<String, dynamic> list;

  @override
  List<Object?> get props => [];
}

class OfertSomeoneCreate extends OfertSomeoneEvent {
  const OfertSomeoneCreate({
    required this.listOffer,
  });

  final List<dynamic> listOffer;
  @override
  List<Object?> get props => [
        listOffer,
      ];
}
