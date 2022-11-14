import 'package:flutter/material.dart';

enum EstadoFigurita { bueno, malo, regular }

class CreatePublicationView extends StatelessWidget {
  CreatePublicationView({Key? key}) : super(key: key);
  final json = [
    {
      'name': 'Luis Suarez',
      'id': '123',
    },
    {
      'name': 'Cavani',
      'id': '2223',
    },
    {
      'name': 'Messi',
      'id': '1343',
    }
  ];
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
              itemCount: json.length,
              itemBuilder: ((context, index) {
                return _Figuritas(
                  namePlayer: json[index]['name'].toString(),
                  id: json[index]['id'].toString(),
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
                        const Center(
                          child: Text(
                            'Esta seguro que quiere crear una publicación para esta figurita? ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
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
                            onPressed: (() {}),
                            child: const Text(
                              'Crear',
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
