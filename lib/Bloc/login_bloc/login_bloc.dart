import 'package:bloc_app/Bloc/login_bloc/login_events.dart';
import 'package:bloc_app/Bloc/login_bloc/login_states.dart';
import 'package:bloc_app/Utils/Utils.dart';
import 'package:bloc_app/ui/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBloc() : super(LoginBlocState()) {
    on<EmailChangeEvent>(_onEmailChange);
    on<PasswordChangeEvent>(_onPasswordChange);
    on<LoginEvent>(loginAPI);
  }

  void _onEmailChange(EmailChangeEvent events, Emitter<LoginBlocState> emit) {
    emit(state.copyWith(email: events.email));
  }

  void _onPasswordChange(
      PasswordChangeEvent events, Emitter<LoginBlocState> emit) {
    emit(state.copyWith(password: events.password));
  }

  void loginAPI(
    LoginEvent events,
    Emitter<LoginBlocState> emit,
  ) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    Map data = {"email": state.email, "password": state.password};

    try {
      final response =
          await http.post(Uri.parse("https://reqres.in/api/login"), body: data);

      if (response.statusCode == 200) {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Counter()));
        emit(state.copyWith(
            message: "Successfully", loginStatus: LoginStatus.successfully));
      } else {
        emit(state.copyWith(
            message: "Some Think Went Worng", loginStatus: LoginStatus.failed));
      }
    } catch (e) {
      // Utils.FlushBarShow(e.toString(), context);
      emit(state.copyWith(
          message: e.toString(), loginStatus: LoginStatus.failed));
    }
  }
}
