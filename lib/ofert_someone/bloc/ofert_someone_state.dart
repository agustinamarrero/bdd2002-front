part of 'ofert_someone_bloc.dart';

enum OfertSomeoneStatus {
  initial,
  loading,
  loaded,
  error,
}

class OfertSomeoneState extends Equatable {
  const OfertSomeoneState({
    required this.status,
    required this.idPublication,
  });

  const OfertSomeoneState.initial()
      : this(status: OfertSomeoneStatus.initial, idPublication: '');

  final OfertSomeoneStatus status;
  final String idPublication;

  OfertSomeoneState copyWith({
    OfertSomeoneStatus? status,
    String? idPublication,
  }) {
    return OfertSomeoneState(
      status: status ?? this.status,
      idPublication: idPublication ?? this.idPublication,
    );
  }

  @override
  List<Object> get props => [
        status,
        idPublication,
      ];
}
