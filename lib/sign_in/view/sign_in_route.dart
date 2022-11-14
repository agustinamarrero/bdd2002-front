import 'package:flutter/material.dart';
import 'package:bdd2022/sign_in/sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInRoute extends StatelessWidget {
  const SignInRoute({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (ctx) {
        return BlocProvider(
          create: (_) => SignInBloc(),
          child: const SignInView(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SignInView();
  }
}