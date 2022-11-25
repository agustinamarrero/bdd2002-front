import 'package:bdd2022/oferts_user/oferts_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfertsUserView extends StatelessWidget {
  const OfertsUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listPublications =
        context.select((OfertsUserBloc bloc) => bloc.state.listOferts);
    final status = context.select((OfertsUserBloc bloc) => bloc.state.status);
    return status == OfertsUserStatus.loaded
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
        : status == OfertsUserStatus.error
            ? const Scaffold(
                body: Center(
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
                  backgroundColor: const Color(0xff891638),
                  shadowColor: Colors.white,
                  elevation: 0,
                  title: const Text(
                    'Ofertas',
                    style: TextStyle(
                      fontFamily: 'Qatar2022',
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                    child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Aqui puede observar las ofertas que hicieron sobre sus figuritas',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Qatar2022',
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: _Card(
                        listPublications: listPublications,
                      ),
                    ),
                  ],
                )),
              );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    Key? key,
    required this.listPublications,
  }) : super(key: key);

  final listPublications;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: listPublications.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: const Color(0xff891638),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8.0) //
                    ),
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      listPublications[index]['description_bidder'].toString(),
                      style: const TextStyle(
                        fontFamily: 'Qatar2022',
                        fontSize: 15,
                      ),
                    ),
                  ),
                  listPublications[index]['description_publisher'] != null
                      ? _Ofers(
                          figuresOferts: listPublications[index]
                              ['description_publisher'],
                        )
                      : Container(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: const Color(0xff891638),
                          disabledForegroundColor:
                              Colors.white.withOpacity(0.38),
                        ),
                        onPressed: (() {
                          context.read<OfertsUserBloc>().add(OfertsUserAccepted(
                              idPublication: listPublications[index]
                                  ['id_offer']));
                        }),
                        child: const Text(
                          'Aceptar',
                          style: TextStyle(
                              fontFamily: 'Qatar2022', color: Colors.white),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: const Color(0xff891638),
                          disabledForegroundColor:
                              Colors.white.withOpacity(0.38),
                        ),
                        onPressed: (() {
                          context.read<OfertsUserBloc>().add(OfertsUserRejected(
                              idPublication: listPublications[index]
                                  ['id_offer']));
                        }),
                        child: const Text(
                          'Rechazar',
                          style: TextStyle(
                              fontFamily: 'Qatar2022', color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }));
  }
}

class _Ofers extends StatelessWidget {
  const _Ofers({
    required this.figuresOferts,
  });

  final List figuresOferts;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: ListView.builder(
          shrinkWrap: true,
          itemCount: figuresOferts.length,
          itemBuilder: ((context, index) {
            return SizedBox(
              height: 25,
              width: 25,
              child: Text(
                figuresOferts[index].toString(),
              ),
            );
          })),
    );
  }
}
