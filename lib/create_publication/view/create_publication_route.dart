import 'package:bdd2022/create_publication/create_publication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePublicationRoute extends StatelessWidget {
  const CreatePublicationRoute({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (ctx) {
        return BlocProvider(
          create: (_) => CreatePublicationBloc(),
          child: CreatePublicationView(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CreatePublicationView();
  }
}
