import 'package:flutter/material.dart';

final json = [
  {
    'namePlayer': 'Luis Suarez',
    'figures': [
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
    'stateOfert': 'No aceptada',
  },
  {
    'namePlayer': 'Messi',
    'figures': [
      {
        'namePlayer': 'Juan',
      },
      {
        'namePlayer': 'Luis',
      },
    ],
    'stateOfert': 'Aceptada',
  },
];

class ActiveOfertsView extends StatelessWidget {
  const ActiveOfertsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          children: const [
            Padding(
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
            _Card(),
          ],
        )),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: json.length,
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
                      json[index]['namePlayer'].toString(),
                      style: const TextStyle(
                        fontFamily: 'Qatar2022',
                        fontSize: 15,
                      ),
                    ),
                  ),
                  _Ofers(
                    figuresOferts: json[index]['figures'] as List,
                    stateOfert: json[index]['stateOfert'].toString(),
                  ),
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
  }) : super(key: key);

  final List figuresOferts;
  final String stateOfert;

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
                    figuresOferts[index]['namePlayer'].toString(),
                  ),
                );
              })),
          trailing: TextButton(
            style: TextButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor: const Color(0xff891638),
              disabledForegroundColor: Colors.white.withOpacity(0.38),
            ),
            onPressed: (() {}),
            child: const Text(
              'Borrar',
              style: TextStyle(fontFamily: 'Qatar2022', color: Colors.white),
            ),
          ),
        ),
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
