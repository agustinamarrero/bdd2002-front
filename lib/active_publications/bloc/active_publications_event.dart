part of 'active_publications_bloc.dart';

abstract class ActivePublicationsEvent extends Equatable {
  const ActivePublicationsEvent();
}

class ActivePublicationsGet extends ActivePublicationsEvent {
  const ActivePublicationsGet();

  @override
  List<Object?> get props => [];
}

class ActivePublicationsStateChanged extends ActivePublicationsEvent {
  const ActivePublicationsStateChanged(this.publication);

  final Publication publication;
  @override
  List<Object?> get props => [publication];
}
