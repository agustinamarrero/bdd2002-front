part of 'login_bloc.dart';

enum LoginStatus {
  initial,
  loading,
  loaded,
  error,
}

class LoginState extends Equatable {
  const LoginState({
    required this.status,
    required this.ci,
    required this.lastname,
    required this.name,
    required this.password,
    required this.phone,
    required this.email,
  });

  const LoginState.initial()
      : this(
            status: LoginStatus.initial,
            ci: '',
            lastname: '',
            name: '',
            password: '',
            phone: '',
            email: '');

  final LoginStatus status;
  final String name;
  final String lastname;
  final String ci;
  final String password;
  final String phone;
  final String email;

  LoginState copyWith({
    LoginStatus? status,
    String? name,
    String? lastname,
    String? ci,
    String? password,
    String? phone,
    String? email,
  }) {
    return LoginState(
      status: status ?? this.status,
      name: name ?? this.name,
      ci: ci ?? this.ci,
      lastname: lastname ?? this.lastname,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }

  @override
  List<Object> get props => [
        status,
        name,
        ci,
        lastname,
        password,
        phone,
        email,
      ];
}
