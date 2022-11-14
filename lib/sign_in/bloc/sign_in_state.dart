part of 'sign_in_bloc.dart';

enum SignInStatus {
  initial,
  loading,
  loaded,
  error,
}

class SignInState extends Equatable {
  const SignInState({
    required this.status,
    required this.email,
    required this.password,
  });

  const SignInState.initial()
      : this(
          status: SignInStatus.initial,
          email: '',
          password: '',
        );

  final SignInStatus status;
  final String email;
  final String password;

  SignInState copyWith({
    SignInStatus? status,
    String? email,
    String? password,
  }) {
    return SignInState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [
        status,
        email,
        password,
      ];
}
