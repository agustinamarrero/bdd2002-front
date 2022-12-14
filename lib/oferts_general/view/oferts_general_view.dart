import 'package:bdd2022/active_oferts/active_oferts.dart';
import 'package:bdd2022/active_publications/view/active_publications_route.dart';
import 'package:bdd2022/create_publication/create_publication.dart';
import 'package:bdd2022/main.dart';
import 'package:bdd2022/ofert_someone/ofert_someone.dart';
import 'package:bdd2022/oferts_general/oferts_general.dart';
import 'package:bdd2022/oferts_user/oferts_user.dart';
import 'package:bdd2022/upload_figurita/upload_figurita.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfertsGeneralView extends StatelessWidget {
  const OfertsGeneralView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listOferts =
        context.select((OfertsGeneralBloc bloc) => bloc.state.listOferts);
    final status =
        context.select((OfertsGeneralBloc bloc) => bloc.state.status);
    return status == OfertsGeneralStatus.loaded
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
        : status == OfertsGeneralStatus.error
            ? Scaffold(
                appBar: AppBar(
                  backgroundColor: const Color(0xff891638),
                  shadowColor: Colors.white,
                  elevation: 0,
                  title: const Text(
                    'Publicaciones',
                    style: TextStyle(
                      fontFamily: 'Qatar2022',
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                drawer: const _Drawer(),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(
                      child: Text(
                        'No hay publicaciones activas en el momento',
                        style: TextStyle(
                          fontFamily: 'Qatar2022',
                          color: Colors.black,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              )
            : BlocListener<OfertsGeneralBloc, OfertsGeneralState>(
                listener: (context, state) {
                  Navigator.of(context).push(OfertSomeoneRoute.route());
                },
                listenWhen: (previous, current) {
                  return current.status == OfertsUserStatus.loaded;
                },
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: const Color(0xff891638),
                    shadowColor: Colors.white,
                    elevation: 0,
                    title: const Text(
                      'Publicaciones',
                      style: TextStyle(
                        fontFamily: 'Qatar2022',
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  drawer: const _Drawer(),
                  body: BlocListener<OfertsGeneralBloc, OfertsGeneralState>(
                    listener: (context, state) {},
                    listenWhen: (previous, current) {
                      return previous.listOferts != current.listOferts;
                    },
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            itemCount: listOferts.length,
                            itemBuilder: (context, index) {
                              return _Ofert(
                                description:
                                    listOferts[index]['description'].toString(),
                                statePlayer: listOferts[index]['state_damage']
                                    .toString(),
                                id: listOferts[index]['publication_id']
                                    .toString(),
                              );
                            },
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(8),
                          ),
                        )
                      ],
                    )),
                  ),
                ),
              );
  }
}

class _Drawer extends StatelessWidget {
  const _Drawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff891638),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 38.0),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                ),
                title: const Text(
                  'Mis publicaciones',
                  style: TextStyle(
                    fontFamily: 'Qatar2022',
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(ActivePublicationsRoute.route());
                },
              ),
              ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                ),
                title: const Text(
                  'Ofertas',
                  style: TextStyle(
                    fontFamily: 'Qatar2022',
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(ActiveOfertsRoute.route());
                },
              ),
              ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                ),
                title: const Text(
                  'Subir Figurita',
                  style: TextStyle(
                    fontFamily: 'Qatar2022',
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(UploadFiguritaRoute.route());
                },
              ),
              ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                ),
                title: const Text(
                  'Crear publicación',
                  style: TextStyle(
                    fontFamily: 'Qatar2022',
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(CreatePublicationRoute.route());
                },
              ),
              ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                ),
                title: const Text(
                  'Cerrar sesión',
                  style: TextStyle(
                    fontFamily: 'Qatar2022',
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MyApp.route());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Ofert extends StatelessWidget {
  const _Ofert({
    required this.description,
    required this.statePlayer,
    required this.id,
  });

  final String description;
  final String statePlayer;

  final String id;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: statePlayer == 'Bueno'
          ? const Icon(
              Icons.circle,
              size: 30,
              color: Colors.green,
            )
          : statePlayer == 'Regular'
              ? const Icon(Icons.circle, size: 30, color: Colors.yellow)
              : const Icon(Icons.circle, size: 30, color: Colors.red),
      title: Text(description),
      trailing: TextButton(
        onPressed: (() {
          context.read<OfertsGeneralBloc>().add(OfertsGeneralSubmited(
                id,
                description,
                statePlayer,
              ));
          showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 200,
                  color: const Color(0xff891638),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Center(
                          child: Text(
                            'Quiere realizar una oferta al usuario  por la figurita  $description',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Qatar2022',
                                fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: Colors.white,
                              disabledForegroundColor:
                                  Colors.white.withOpacity(0.38),
                            ),
                            onPressed: (() {
                              Navigator.of(context)
                                  .push(OfertSomeoneRoute.route());
                            }),
                            child: const Text(
                              'Ofertar',
                              style: TextStyle(
                                fontFamily: 'Qatar2022',
                                color: Color(0xff891638),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        }),
        style: TextButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: const Color(0xff891638),
          disabledForegroundColor: Colors.white.withOpacity(0.38),
        ),
        child: const Text(
          'Ofertar',
          style: TextStyle(
            fontFamily: 'Qatar2022',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
