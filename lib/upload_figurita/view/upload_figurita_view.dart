import 'package:bdd2022/upload_figurita/bloc/upload_figurita_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum EstadoFigurita { Bueno, Malo, Regular }

class UploadFiguritaView extends StatelessWidget {
  const UploadFiguritaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status =
        context.select((UploadFiguritaBloc bloc) => bloc.state.status);
    return BlocListener<UploadFiguritaBloc, UploadFiguritaState>(
      listener: (context, state) {
        //Navigator.of(context).pop();
      },
      listenWhen: (previous, current) {
        return current.status == UploadFiguritaStatus.loaded;
      },
      child: status == UploadFiguritaStatus.loaded
          ? AlertDialog(
              title: const Text('Acción satisfactoria'),
              actions: <Widget>[
                  TextButton(
                    child: const Text('Approve'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ])
          : Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                backgroundColor: const Color(0xff891638),
                title: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Subir Figurita',
                    style: TextStyle(
                      fontFamily: 'Qatar2022',
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                  child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Ingrese los datos para subir una nueva figurita',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Qatar2022',
                        fontSize: 17,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 28.0),
                    child: Text(
                      'Número de figurita',
                      style: TextStyle(fontFamily: 'Qatar2022', fontSize: 15),
                    ),
                  ),
                  _InputText(
                    hintText: 'Número',
                    onChanged: ((p0) {
                      context
                          .read<UploadFiguritaBloc>()
                          .add(UploadFiguritaNumberPlayer(p0));
                    }),
                  ),
                  const _Estado(),
                  Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: TextButton(
                        onPressed: (() {
                          context
                              .read<UploadFiguritaBloc>()
                              .add(const UploadFiguritaSubmited());
                          //Si todo ok navegar
                          Navigator.of(context).pop();
                        }),
                        style: TextButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: const Color(0xff891638),
                            disabledForegroundColor:
                                Colors.white.withOpacity(0.38),
                            minimumSize: const Size(300, 40)),
                        child: const Text(
                          'Crear',
                          style: TextStyle(
                            fontFamily: 'Qatar2022',
                            color: Colors.white,
                          ),
                        ),
                      )),
                ],
              )),
            ),
    );
  }
}

class _Estado extends StatefulWidget {
  const _Estado({
    Key? key,
  }) : super(key: key);

  @override
  State<_Estado> createState() => _EstadoState();
}

class _EstadoState extends State<_Estado> {
  final EstadoFigurita _character = EstadoFigurita.Bueno;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 28.0),
          child: Text(
            'Estado',
            style: TextStyle(fontFamily: 'Qatar2022', fontSize: 15),
          ),
        ),
        ListTile(
          title: const Text(
            'Bueno',
            style: TextStyle(fontFamily: 'Qatar2022', fontSize: 15),
          ),
          leading: Radio<EstadoFigurita>(
            fillColor: MaterialStateProperty.all(
              const Color(0xff891638),
            ),
            value: EstadoFigurita.Bueno,
            groupValue: _character,
            onChanged: (EstadoFigurita? value) {
              context
                  .read<UploadFiguritaBloc>()
                  .add(UploadFiguritaStateFigure(value!));
            },
          ),
        ),
        ListTile(
          title: const Text(
            'Malo',
            style: TextStyle(fontFamily: 'Qatar2022', fontSize: 15),
          ),
          leading: Radio<EstadoFigurita>(
            fillColor: MaterialStateProperty.all(
              const Color(0xff891638),
            ),
            value: EstadoFigurita.Malo,
            groupValue: _character,
            onChanged: (EstadoFigurita? value) {
              context
                  .read<UploadFiguritaBloc>()
                  .add(UploadFiguritaStateFigure(value!));
            },
          ),
        ),
        ListTile(
          title: const Text(
            'Regular',
            style: TextStyle(fontFamily: 'Qatar2022', fontSize: 15),
          ),
          leading: Radio<EstadoFigurita>(
            fillColor: MaterialStateProperty.all(
              const Color(0xff891638),
            ),
            value: EstadoFigurita.Regular,
            groupValue: _character,
            onChanged: (EstadoFigurita? value) {
              context
                  .read<UploadFiguritaBloc>()
                  .add(UploadFiguritaStateFigure(value!));
            },
          ),
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
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp('[0-9]*')),
        ],
        keyboardType: TextInputType.number,
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
