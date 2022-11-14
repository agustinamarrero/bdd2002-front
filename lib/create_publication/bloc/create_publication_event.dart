part of 'create_publication_bloc.dart';

abstract class CreatePublicationEvent extends Equatable {
  const CreatePublicationEvent();
}

class CreatePublicationSubmited extends CreatePublicationEvent {
  const CreatePublicationSubmited(
    this.id,
    this.namePlayer,
  );

  final String namePlayer;
  final String id;

  @override
  List<Object?> get props => [
        namePlayer,
        id,
      ];
}
