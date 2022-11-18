part of 'oferts_user_bloc.dart';

enum OfertsUserStatus {
  initial,
  loading,
  loaded,
  error,
}

class OfertsUserState extends Equatable {
  const OfertsUserState({
    required this.status,
    required this.listOferts,
  });

  const OfertsUserState.initial()
      : this(
          status: OfertsUserStatus.initial,
          listOferts: const [],
        );

  final OfertsUserStatus status;
  final List<Map<String, String>> listOferts;

  OfertsUserState copyWith({
    OfertsUserStatus? status,
    List<Map<String, String>>? listOferts,
  }) {
    return OfertsUserState(
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
