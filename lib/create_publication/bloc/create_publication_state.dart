part of 'create_publication_bloc.dart';

enum CreatePublicationStatus {
  initial,
  loading,
  loaded,
  error,
}

class CreatePublicationState extends Equatable {
  CreatePublicationState({
    required this.status,
    required this.listFigures,
  });

  CreatePublicationState.initial()
      : this(
          status: CreatePublicationStatus.initial,
          listFigures: [{}],
        );

  final CreatePublicationStatus status;
  List<dynamic> listFigures;

  CreatePublicationState copyWith({
    CreatePublicationStatus? status,
    List<dynamic>? listFigures,
  }) {
    return CreatePublicationState(
      status: status ?? this.status,
      listFigures: listFigures ?? this.listFigures,
    );
  }

  @override
  List<Object> get props => [
        status,
        listFigures,
      ];
}
