import 'package:bdd2022/active_oferts/active_oferts.dart';
import 'package:bdd2022/active_publications/bloc/active_publications_bloc.dart';
import 'package:bdd2022/models/publication.dart';
import 'package:bdd2022/oferts_user/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivePublicationsView extends StatelessWidget {
  const ActivePublicationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status =
        context.select((ActivePublicationsBloc bloc) => bloc.state.status);
    final listPublications = context
        .select((ActivePublicationsBloc bloc) => bloc.state.listPublications);
    // final listPublications = [
    //   {
    //     'namePlayer': 'Luis Suarez',
    //     'stateOfert': 'Activa',
    //     'idOferts': '23',
    //   },
    //   {
    //     'namePlayer': 'Messi',
    //     'stateOfert': 'Desactivada',
    //     'idOferts': null,
    //   },
    //   {
    //     'namePlayer': 'Cavani',
    //     'stateOfert': 'Desactivada',
    //     'idOferts': null,
    //   },
    // ];
    return Scaffold(
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
            'Mis Publicaciones',
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
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: listPublications.length,
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                return _Publication(
                  namePlayer: listPublications[index]['description'].toString(),
                  stateOfert: listPublications[index]['activated'].toString(),
                  idOfert: listPublications[index]['publication_id'].toString(),
                );
              },
            ),
          )
        ],
      )),
    );
  }
}

class _Publication extends StatelessWidget {
  const _Publication({
    required this.namePlayer,
    required this.stateOfert,
    this.idOfert,
  });

  final String namePlayer;
  final String stateOfert;
  final String? idOfert;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          Navigator.of(context).push(OfertsUserRoute.route());
        },
        icon: const Icon(
          Icons.emoji_people,
          size: 30,
        ),
      ),
      title: Text(namePlayer),
      trailing: TextButton(
        onPressed: (() {
          context.read<ActivePublicationsBloc>().add(
              ActivePublicationsStateChanged(
                  Publication(namePlayer, stateOfert, idOfert!)));
        }),
        style: TextButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: const Color(0xff891638),
          disabledForegroundColor: Colors.white.withOpacity(0.38),
        ),
        child: stateOfert == 'f'
            ? const Text(
                'Activar',
                style: TextStyle(
                  fontFamily: 'Qatar2022',
                  color: Colors.white,
                ),
              )
            : const Text(
                'Descativar',
                style: TextStyle(
                  fontFamily: 'Qatar2022',
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
