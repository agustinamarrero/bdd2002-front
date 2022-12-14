import 'package:bdd2022/oferts_user/oferts_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfertsUserRoute extends StatelessWidget {
  const OfertsUserRoute({Key? key, required this.idOffer}) : super(key: key);

  final String idOffer;

  Route<void> route() {
    return MaterialPageRoute(
      builder: (ctx) {
        return BlocProvider(
          create: (_) => OfertsUserBloc()..add(OfertsUserGet(idOffer: idOffer)),
          child: const OfertsUserView(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const OfertsUserView();
  }
}
