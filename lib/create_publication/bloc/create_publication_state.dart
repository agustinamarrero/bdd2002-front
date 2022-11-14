part of 'create_publication_bloc.dart';

enum CreatePublicationStatus {
  initial,
  loading,
  loaded,
  error,
}

class CreatePublicationState extends Equatable {
  const CreatePublicationState({
    required this.status,
  });

  const CreatePublicationState.initial()
      : this(
          status: CreatePublicationStatus.initial,
        );

  final CreatePublicationStatus status;

  CreatePublicationState copyWith({
    CreatePublicationStatus? status,
  }) {
    return CreatePublicationState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        status,
      ];
}
