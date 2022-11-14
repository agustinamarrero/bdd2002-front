part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginNameChanged extends LoginEvent {
  const LoginNameChanged(this.name);

  final String name;

  @override
  List<Object?> get props => [name];
}

class LoginLastnameChanged extends LoginEvent {
  const LoginLastnameChanged(this.lastname);

  final String lastname;

  @override
  List<Object?> get props => [lastname];
}

class LoginEmailChanged extends LoginEvent {
  const LoginEmailChanged(this.email);

  final String email;

  @override
  List<Object?> get props => [email];
}

class LoginCiChanged extends LoginEvent {
  const LoginCiChanged(this.ci);

  final String ci;

  @override
  List<Object?> get props => [ci];
}

class LoginPhoneChanged extends LoginEvent {
  const LoginPhoneChanged(this.phone);

  final String phone;

  @override
  List<Object?> get props => [phone];
}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object?> get props => [password];
}

class LoginFormSubmited extends LoginEvent {
  const LoginFormSubmited();

  @override
  List<Object?> get props => [];
}
