import 'package:bdd2022/login/login.dart';
import 'package:bdd2022/oferts_general/oferts_general.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status = context.select((LoginBloc bloc) => bloc.state.status);
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        Navigator.of(context).push(OfertsGeneralRoute.route());
      },
      listenWhen: (previous, current) {
        return current.status == LoginStatus.loaded;
      },
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(30),
          child: TextButton(
            onPressed: (() {
              context.read<LoginBloc>().add(const LoginFormSubmited());
              //si el estado el valido voy a navegar
            }),
            style: TextButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: const Color(0xff891638),
                disabledForegroundColor: Colors.white.withOpacity(0.38),
                minimumSize: const Size(300, 40)),
            child: const Text(
              'Registrarse',
              style: TextStyle(
                fontFamily: 'Qatar2022',
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Column(
          children: const [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Ingrese sus datos',
                  style: TextStyle(fontFamily: 'Qatar2022', fontSize: 25),
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: _Form(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Form extends StatelessWidget {
  const _Form({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _InputText(
          hintText: 'Nombre',
          onChanged: ((p0) {
            context.read<LoginBloc>().add(LoginNameChanged(p0));
          }),
        ),
        _InputText(
          hintText: 'Apellido',
          onChanged: ((p0) {
            context.read<LoginBloc>().add(LoginLastnameChanged(p0));
          }),
        ),
        _InputText(
          hintText: 'Email',
          onChanged: ((p0) {
            context.read<LoginBloc>().add(LoginEmailChanged(p0));
          }),
        ),
        _InputText(
          hintText: 'Cedula',
          onChanged: ((p0) {
            context.read<LoginBloc>().add(LoginCiChanged(p0));
          }),
        ),
        _InputText(
          hintText: 'Telefono',
          onChanged: ((p0) {
            context.read<LoginBloc>().add(LoginPhoneChanged(p0));
          }),
        ),
        _InputText(
          hintText: 'Contraseña',
          onChanged: ((p0) {
            context.read<LoginBloc>().add(LoginPasswordChanged(p0));
          }),
        ),
      ],
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
        keyboardType: TextInputType.text,
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
