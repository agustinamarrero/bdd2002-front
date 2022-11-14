part of 'active_publications_bloc.dart';

enum ActivePublicationsStatus {
  initial,
  loading,
  loaded,
  error,
}

class ActivePublicationsState extends Equatable {
  const ActivePublicationsState({
    required this.status,
    required this.listPublications,
  });

  const ActivePublicationsState.initial()
      : this(
          status: ActivePublicationsStatus.initial,
          listPublications: const [],
        );

  final ActivePublicationsStatus status;
  final List<Publication> listPublications;

  ActivePublicationsState copyWith(
      {ActivePublicationsStatus? status, List<Publication>? listPublications}) {
    return ActivePublicationsState(
      status: status ?? this.status,
      listPublications: listPublications ?? this.listPublications,
    );
  }

  @override
  List<Object> get props => [
        status,
        listPublications,
      ];
}
