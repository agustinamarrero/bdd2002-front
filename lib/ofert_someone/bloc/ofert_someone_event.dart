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

class OfertSomeoneCreate extends OfertSomeoneEvent {
  const OfertSomeoneCreate();
  @override
  List<Object?> get props => [];
}
