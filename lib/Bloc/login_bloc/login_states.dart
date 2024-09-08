import 'package:equatable/equatable.dart';

enum LoginStatus { initial, loading, successfully, failed }

class LoginBlocState extends Equatable {
  String email;
  String password;
  String message;
  LoginStatus loginStatus;

  LoginBlocState(
      {this.email = "",
      this.password = "",
      this.message = "",
      this.loginStatus = LoginStatus.initial});

  LoginBlocState copyWith(
      {String? email,
      String? password,
      String? message,
      LoginStatus? loginStatus}) {
    return LoginBlocState(
        password: password ?? this.password,
        email: email ?? this.email,
        message: message ?? this.message,
        loginStatus: loginStatus ?? this.loginStatus);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [email, password, message, loginStatus];
}
