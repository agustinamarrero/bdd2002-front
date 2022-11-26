import 'package:bdd2022/active_oferts/active_oferts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final listPublications = [
  {
    'description_bidder': 'Luis Suarez',
    'description_publisher': [
      {
        'namePlayer': 'Messi',
      },
      {
        'namePlayer': 'Canvani',
      },
      {
        'namePlayer': 'Pepe',
      }
    ],
    'state_offer': 'Rechazada',
  },
  {
    'description_bidder': 'Messi',
    'description_publisher': [
      {
        'namePlayer': 'Juan',
      },
      {
        'namePlayer': 'Luis',
      },
    ],
    'state_offer': 'Aceptada',
  },
];

class ActiveOfertsView extends StatelessWidget {
  const ActiveOfertsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final listPublications =
    //     context.select((ActiveOfertsBloc bloc) => bloc.state.listOffer);
    print(listPublications);
    final status = context.select((ActiveOfertsBloc bloc) => bloc.state.status);
    return status == ActiveOfertsStatus.error
        ? Scaffold(
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
            body: const Center(
              child: Text('No hay ofertas'),
            ),
          )
        : (status == ActiveOfertsStatus.loaded)
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
                      'Ofertas',
                      style: TextStyle(
                        fontFamily: 'Qatar2022',
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                body: SafeArea(
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Aqui puede observar las ofertas que usted realizo ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Qatar2022',
                            fontSize: 17,
                          ),
                        ),
                      ),
                      listPublications.isNotEmpty
                          ? _Card(
                              listOffer: listPublications,
                            )
                          : Container(),
                    ],
                  )),
                ),
              );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    Key? key,
    required this.listOffer,
  }) : super(key: key);
  final List<dynamic> listOffer;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: listOffer.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
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
                      listOffer[index]['description_bidder'].toString(),
                      style: const TextStyle(
                        fontFamily: 'Qatar2022',
                        fontSize: 15,
                      ),
                    ),
                  ),
                  listOffer[index]['description_publisher'] != null
                      ? _Ofers(
                          listOffer: listOffer[index],
                          figuresOferts: listOffer[index]
                              ['description_publisher'],
                          stateOfert:
                              listOffer[index]['state_offer'].toString(),
                        )
                      : Container()
                ],
              ),
            ),
          );
        }));
  }
}

class _Ofers extends StatelessWidget {
  const _Ofers({
    Key? key,
    required this.figuresOferts,
    required this.stateOfert,
    required this.listOffer,
  }) : super(key: key);

  final List figuresOferts;
  final String stateOfert;
  final Map<String, dynamic>? listOffer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
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
            trailing: stateOfert == 'Rechazada'
                ? TextButton(
                    style: TextButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: const Color(0xff891638),
                      disabledForegroundColor: Colors.white.withOpacity(0.38),
                    ),
                    onPressed: listOffer!.isNotEmpty
                        ? (() {
                            context.read<ActiveOfertsBloc>().add(
                                ActiveOfertOfferUser(listOffer: listOffer!));
                          })
                        : null,
                    child: const Text(
                      'Contraoferta',
                      style: TextStyle(
                          fontFamily: 'Qatar2022', color: Colors.white),
                    ),
                  )
                : const SizedBox()),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Estado de la oferta: '),
              Text(
                stateOfert,
                style: const TextStyle(fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ],
    );
  }
}
