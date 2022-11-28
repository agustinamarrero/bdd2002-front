import 'package:bdd2022/ofert_someone/ofert_someone.dart';
import 'package:bdd2022/select_figures/select_figures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectFiguresView extends StatefulWidget {
  const SelectFiguresView({Key? key}) : super(key: key);

  @override
  State<SelectFiguresView> createState() => _SelectFiguresViewState();
}

class _SelectFiguresViewState extends State<SelectFiguresView> {
  // final listFigures = [
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    final listFigures =
        context.select((SelectFiguresBloc bloc) => bloc.state.listFigures);
    final status =
        context.select((SelectFiguresBloc bloc) => bloc.state.status);
    return status == OfertSomeoneStatus.loaded
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
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          onPressed: (() {
                            context
                                .read<SelectFiguresBloc>()
                                .add(SelectFiguresChanged(listFigures[index]));
                          }),
                          style: TextButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: const Color(0xff891638),
                              disabledForegroundColor:
                                  Colors.white.withOpacity(0.38),
                              minimumSize: const Size(20, 20)),
                          child: const Text(
                            'Agregar',
                            style: TextStyle(
                              fontFamily: 'Qatar2022',
                              color: Colors.white,
                            ),
                          ),
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
                      context
                          .read<SelectFiguresBloc>()
                          .add(SelectFiguresCreate(listOffer: listFigures));
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
          );
  }
}
