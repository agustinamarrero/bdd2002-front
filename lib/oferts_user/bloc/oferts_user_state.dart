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
    required this.idOffer,
  });

  const OfertsUserState.initial()
      : this(
          status: OfertsUserStatus.initial,
          listOferts: const [],
          idOffer: '',
        );

  final OfertsUserStatus status;
  final String idOffer;
  final List<dynamic> listOferts;

  OfertsUserState copyWith({
    OfertsUserStatus? status,
    List<dynamic>? listOferts,
    String? idOffer,
  }) {
    return OfertsUserState(
      status: status ?? this.status,
      listOferts: listOferts ?? this.listOferts,
      idOffer: idOffer ?? this.idOffer,
    );
  }

  @override
  List<Object> get props => [
        status,
        listOferts,
        idOffer,
      ];
}
