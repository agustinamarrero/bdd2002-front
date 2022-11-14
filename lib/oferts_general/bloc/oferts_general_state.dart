part of 'oferts_general_bloc.dart';

enum OfertsGeneralStatus {
  initial,
  loading,
  loaded,
  error,
}

class OfertsGeneralState extends Equatable {
  const OfertsGeneralState({
    required this.status,
    required this.listOferts,
  });

  const OfertsGeneralState.initial()
      : this(
          status: OfertsGeneralStatus.initial,
          listOferts: const [],
        );

  final OfertsGeneralStatus status;
  final List<Map<String, String>> listOferts;

  OfertsGeneralState copyWith({
    OfertsGeneralStatus? status,
    List<Map<String, String>>? listOferts,
  }) {
    return OfertsGeneralState(
      status: status ?? this.status,
      listOferts: listOferts ?? this.listOferts,
    );
  }

  @override
  List<Object> get props => [
        status,
        listOferts,
      ];
}
