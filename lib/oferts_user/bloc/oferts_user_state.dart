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
  });

  const OfertsUserState.initial()
      : this(        
          status: OfertsUserStatus.initial,
        );

  final OfertsUserStatus status;

  OfertsUserState copyWith({
    OfertsUserStatus? status,
  }) {
    return OfertsUserState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        status,
      ];
}
