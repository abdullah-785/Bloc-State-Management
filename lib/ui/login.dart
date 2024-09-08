import 'package:bloc_app/Bloc/login_bloc/login_bloc.dart';
import 'package:bloc_app/Bloc/login_bloc/login_events.dart';
import 'package:bloc_app/Bloc/login_bloc/login_states.dart';
import 'package:bloc_app/Utils/Utils.dart';
import 'package:bloc_app/ui/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();

  late LoginBloc _loginBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).width * 1;

    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (_) => LoginBloc(),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Sign In",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Hi! Welcome back, you've been missed",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Email",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    )),
                SizedBox(
                  height: 4,
                ),
                BlocBuilder<LoginBloc, LoginBlocState>(
                    buildWhen: (previous, current) =>
                        previous.email != current.email,
                    builder: (context, state) {
                      return Container(
                        height: 56,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          focusNode: _emailFocus,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(top: 0, bottom: 0, left: 16),
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              size: 22,
                            ),
                            hintText: "example@gamil.com",
                            border: outlineBorder(),
                            focusedBorder: focusBorder(),
                            enabledBorder: enableBorder(),
                          ),
                          onChanged: (value) {
                            context
                                .read<LoginBloc>()
                                .add(EmailChangeEvent(value));
                          },
                          onFieldSubmitted: (value) {},
                        ),
                      );
                    }),
                const SizedBox(
                  height: 15,
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Password",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    )),
                SizedBox(
                  height: 4,
                ),

                ///
                ///
                BlocBuilder<LoginBloc, LoginBlocState>(
                    buildWhen: (previous, current) =>
                        previous.password != current.password,
                    builder: (context, state) {
                      return Container(
                        height: 56,
                        child: TextFormField(
                          controller: _passwordController,
                          focusNode: _passwordFocus,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(top: 0, bottom: 0, left: 16),
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              size: 22,
                            ),
                            hintText: "Passoword",
                            border: outlineBorder(),
                            focusedBorder: focusBorder(),
                            enabledBorder: enableBorder(),
                          ),
                          onChanged: (value) {
                            context
                                .read<LoginBloc>()
                                .add(PasswordChangeEvent(value));
                          },
                          onFieldSubmitted: (value) {},
                        ),
                      );
                    }),

                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocListener<LoginBloc, LoginBlocState>(
                  listener: (context, state) {
                    if (state.loginStatus == LoginStatus.failed) {
                      Utils.FlushBarShow(state.message, context);
                    } else if (state.loginStatus == LoginStatus.successfully) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Counter()));
                    }
                  },
                  child: BlocBuilder<LoginBloc, LoginBlocState>(
                    buildWhen: (previous, current) => false,
                    builder: (context, state) {
                      return SizedBox(
                        width: width * .8,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            onPressed: () async {
                              context.read<LoginBloc>().add(LoginEvent());
                            },
                            child: state.loginStatus == LoginStatus.loading
                                ? CircularProgressIndicator()
                                : Text(
                                    "Sign In",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  static OutlineInputBorder focusBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
          width: .4, color: Color.fromARGB(255, 178, 177, 177)),
      borderRadius: BorderRadius.circular(8.0),
    );
  }

  static OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(width: .4));
  }

  static OutlineInputBorder enableBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(255, 178, 177, 177),
        width: .4,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
  }
}
