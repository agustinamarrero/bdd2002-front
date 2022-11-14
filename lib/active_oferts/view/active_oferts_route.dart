import 'package:bdd2022/active_oferts/active_oferts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActiveOfertsRoute extends StatelessWidget {
  const ActiveOfertsRoute({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (ctx) {
        return BlocProvider(
          create: (_) => ActiveOfertsBloc(),
          child: ActiveOfertsView(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ActiveOfertsView();
  }
}
