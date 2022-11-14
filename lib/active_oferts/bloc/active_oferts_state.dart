part of 'active_oferts_bloc.dart';

enum ActiveOfertsStatus {
  initial,
  loading,
  loaded,
  error,
}

class ActiveOfertsState extends Equatable {
  const ActiveOfertsState({
    required this.status,
  });

  const ActiveOfertsState.initial()
      : this(        
          status: ActiveOfertsStatus.initial,
        );

  final ActiveOfertsStatus status;

  ActiveOfertsState copyWith({
    ActiveOfertsStatus? status,
  }) {
    return ActiveOfertsState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        status,
      ];
}
