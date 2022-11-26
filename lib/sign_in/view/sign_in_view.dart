import 'package:bdd2022/oferts_general/oferts_general.dart';
import 'package:bdd2022/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        Navigator.of(context).push(OfertsGeneralRoute.route());
      },
      listenWhen: (previous, current) {
        return current.status == SignInStatus.loaded;
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: SafeArea(
                child: Column(children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Ingresar',
                    style: TextStyle(
                      fontFamily: 'Qatar2022',
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              _InputText(
                hintText: 'Email',
                onChanged: ((p0) {
                  context.read<SignInBloc>().add(SignInEmailChanged(p0));
                }),
              ),
              _InputText(
                hintText: 'Contraseña',
                onChanged: ((p0) {
                  context.read<SignInBloc>().add(SignInPasswordChanged(p0));
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: TextButton(
                  onPressed: (() {
                    Navigator.of(context).push(OfertsGeneralRoute.route());
                    //  context.read<SignInBloc>().add(const SignInFormSubmited());
                  }),
                  style: TextButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: const Color(0xff891638),
                      disabledForegroundColor: Colors.white.withOpacity(0.38),
                      minimumSize: const Size(300, 40)),
                  child: const Text(
                    'Ingresar',
                    style: TextStyle(
                      fontFamily: 'Qatar2022',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ])),
          ),
        ),
      ),
    );
  }
}

class _InputText extends StatelessWidget {
  const _InputText({
    Key? key,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  final String hintText;
  final Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextField(
        autofocus: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(18),
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(
              color: Color(0xff891638),
              width: 1.5,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(
              color: Color(0xff891638),
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
