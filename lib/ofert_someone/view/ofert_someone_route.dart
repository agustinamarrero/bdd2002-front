import 'package:bdd2022/ofert_someone/ofert_someone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfertSomeoneRoute extends StatelessWidget {
  const OfertSomeoneRoute({
    Key? key,
  }) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (ctx) {
        return BlocProvider(
          create: (_) => OfertSomeoneBloc()..add(const OfertSomeoneSetId()),
          child: const OfertSomeoneView(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const OfertSomeoneView();
  }
}
