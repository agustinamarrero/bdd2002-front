import 'package:bdd2022/ofert_someone/ofert_someone.dart';
import 'package:bdd2022/oferts_general/oferts_general.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfertSomeoneView extends StatelessWidget {
  const OfertSomeoneView({Key? key}) : super(key: key);
  // final listFigures = [
  //   {
  //     'name': 'Luis Suarez',
  //     'id': '123',
  //   },
  //   {
  //     'name': 'Cavani',
  //     'id': '2223',
  //   },
  //   {
  //     'name': 'Messi',
  //     'id': '1343',
  //   }
  // ];
  @override
  Widget build(BuildContext context) {
    final listFigures =
        context.select((OfertSomeoneBloc bloc) => bloc.state.listFigures);
    return BlocListener<OfertSomeoneBloc, OfertSomeoneState>(
      listener: (context, state) {
        // Navigator.of(context).pop();
      },
      listenWhen: (previous, current) {
        return current.status == OfertsGeneralStatus.loaded;
      },
      child: Scaffold(
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
              'Ofertar',
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
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Seleccione las figuritas por las que quiere ofertar',
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
                return ListTile(
                  leading: Checkbox(
                    value: true,
                    onChanged: ((value) {}),
                    fillColor: MaterialStateProperty.all(
                      const Color(0xff891638),
                    ),
                  ),
                  title: Text(
                    listFigures[index]['description'].toString(),
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: TextButton(
                onPressed: (() {
                  //Navigator.of(context).push(OfertsGeneralRoute.route());
                }),
                style: TextButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: const Color(0xff891638),
                    disabledForegroundColor: Colors.white.withOpacity(0.38),
                    minimumSize: const Size(300, 40)),
                child: const Text(
                  'Ofertar',
                  style: TextStyle(
                    fontFamily: 'Qatar2022',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
