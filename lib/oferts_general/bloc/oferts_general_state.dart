part of 'oferts_general_bloc.dart';

enum OfertsGeneralStatus {
  initial,
  loading,
  loaded,
  error,
}

class OfertsGeneralState extends Equatable {
  OfertsGeneralState({
    required this.status,
    required this.listOferts,
  });

  OfertsGeneralState.initial()
      : this(
          status: OfertsGeneralStatus.initial,
          listOferts: [{}],
        );

  final OfertsGeneralStatus status;
  final List<dynamic> listOferts;

  OfertsGeneralState copyWith({
    OfertsGeneralStatus? status,
    List<dynamic>? listOferts,
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
