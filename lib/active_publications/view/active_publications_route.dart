import 'package:flutter/material.dart';
import 'package:bdd2022/active_publications/active_publications.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivePublicationsRoute extends StatelessWidget {
  const ActivePublicationsRoute({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (ctx) {
        return BlocProvider(
          lazy: false,
          create: (_) =>
              ActivePublicationsBloc()..add(const ActivePublicationsGet()),
          child: const ActivePublicationsView(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const ActivePublicationsView();
  }
}
