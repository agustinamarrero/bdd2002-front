import 'package:bdd2022/oferts_general/oferts_general.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfertsGeneralRoute extends StatelessWidget {
  const OfertsGeneralRoute({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (ctx) {
        return BlocProvider(
          create: (_) => OfertsGeneralBloc()..add(const OfertsGeneralGet()),
          child: OfertsGeneralView(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return OfertsGeneralView();
  }
}
