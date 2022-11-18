part of 'active_publications_bloc.dart';

enum ActivePublicationsStatus {
  initial,
  loading,
  loaded,
  error,
}

class ActivePublicationsState extends Equatable {
  ActivePublicationsState({
    required this.status,
    required this.listPublications,
  });

  ActivePublicationsState.initial()
      : this(
          status: ActivePublicationsStatus.initial,
          listPublications: [{}],
        );

  final ActivePublicationsStatus status;
  List<dynamic> listPublications;

  ActivePublicationsState copyWith(
      {ActivePublicationsStatus? status, List<dynamic>? listPublications}) {
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
