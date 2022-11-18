import 'package:bdd2022/create_publication/create_publication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePublicationRoute extends StatelessWidget {
  const CreatePublicationRoute({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (ctx) {
        return BlocProvider(
          lazy: false,
          create: (_) => CreatePublicationBloc()
            ..add(const CreatePublicationsGetFigurita()),
          child: const CreatePublicationView(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const CreatePublicationView();
  }
}
