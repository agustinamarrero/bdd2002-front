part of 'active_oferts_bloc.dart';

enum ActiveOfertsStatus {
  initial,
  loading,
  loaded,
  error,
}

class ActiveOfertsState extends Equatable {
  ActiveOfertsState({
    required this.status,
    required this.listOffer,
  });

  ActiveOfertsState.initial()
      : this(status: ActiveOfertsStatus.initial, listOffer: [{}]);

  final ActiveOfertsStatus status;
  final List<dynamic> listOffer;

  ActiveOfertsState copyWith(
      {ActiveOfertsStatus? status, List<dynamic>? listOffer}) {
    return ActiveOfertsState(
      status: status ?? this.status,
      listOffer: listOffer ?? this.listOffer,
    );
  }

  @override
  List<Object> get props => [
        status,
        listOffer,
      ];
}
