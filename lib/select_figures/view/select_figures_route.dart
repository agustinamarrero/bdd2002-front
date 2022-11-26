import 'package:bdd2022/select_figures/select_figures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectFiguresRoute extends StatelessWidget {
  const SelectFiguresRoute({
    Key? key,
    required this.listPublications,
  }) : super(key: key);

  final Map<String, dynamic> listPublications;
  Route<void> route() {
    return MaterialPageRoute(
      builder: (ctx) {
        return BlocProvider(
          create: (_) => SelectFiguresBloc(listPublications: listPublications),
          child: const SelectFiguresView(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SelectFiguresView();
  }
}
