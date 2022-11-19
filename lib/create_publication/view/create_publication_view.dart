import 'package:bdd2022/create_publication/bloc/create_publication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum EstadoFigurita { bueno, malo, regular }

class CreatePublicationView extends StatelessWidget {
  const CreatePublicationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status =
        context.select((CreatePublicationBloc bloc) => bloc.state.status);
    final listFigures =
        context.select((CreatePublicationBloc bloc) => bloc.state.listFigures);
    return status == CreatePublicationStatus.loaded
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
        : status == CreatePublicationStatus.error
            ? Scaffold(
                appBar: AppBar(
                  backgroundColor: const Color(0xff891638),
                  shadowColor: Colors.white,
                  elevation: 0,
                  title: const Text(
                    'Crear Publicación',
                    style: TextStyle(
                      fontFamily: 'Qatar2022',
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                body: const Center(
                  child: Text(
                    'No hay publicaciones activas en el momento',
                    style: TextStyle(
                      fontFamily: 'Qatar2022',
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              )
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
                      'Crear Publicación',
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
                        'Ingrese los datos para crear una nueva publicación',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Qatar2022',
                          fontSize: 17,
                        ),
                      ),
                    ),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: listFigures.length,
                        itemBuilder: ((context, index) {
                          return _Figuritas(
                            namePlayer:
                                listFigures[index]['description'].toString(),
                            id: listFigures[index]['number'].toString(),
                          );
                        }))
                  ],
                )),
              );
  }
}

class _Figuritas extends StatelessWidget {
  const _Figuritas({
    required this.namePlayer,
    required this.id,
  });

  final String namePlayer;
  final String id;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(namePlayer),
      trailing: TextButton(
        onPressed: (() {
          context
              .read<CreatePublicationBloc>()
              .add(CreatePublicationSubmited(id, namePlayer));
        }),
        style: TextButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: const Color(0xff891638),
          disabledForegroundColor: Colors.white.withOpacity(0.38),
        ),
        child: const Text(
          'Crear',
          style: TextStyle(
            fontFamily: 'Qatar2022',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
