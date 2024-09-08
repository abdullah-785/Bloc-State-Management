import 'package:equatable/equatable.dart';

// part 'login_bloc.dart';

class LoginBlocEvent extends Equatable {
  const LoginBlocEvent();

  List<Object> get props => [];
}

//EmailChangeEvent is hit with we entered the email
class EmailChangeEvent extends LoginBlocEvent {
  String email;

  EmailChangeEvent(this.email);

  List<Object> get props => [email];
}

//Passwrod Change event is hit with we entered the password
class PasswordChangeEvent extends LoginBlocEvent {
  String password;

  PasswordChangeEvent(this.password);

  List<Object> get props => [password];
}

//login bloc event hit with login api is calling
class LoginEvent extends LoginBlocEvent {}
