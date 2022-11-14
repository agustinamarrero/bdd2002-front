import 'package:flutter/material.dart';

class OfertsUserView extends StatelessWidget {
  const OfertsUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: _Card(),
          ),
        ],
      )),
    );
  }
}

class _Card extends StatelessWidget {
  _Card({
    Key? key,
  }) : super(key: key);
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
          'Aceptar',
          style: TextStyle(fontFamily: 'Qatar2022', color: Colors.white),
        ),
      ),
    );
  }
}
