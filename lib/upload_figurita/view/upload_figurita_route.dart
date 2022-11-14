import 'package:flutter/material.dart';
import 'package:bdd2022/upload_figurita/upload_figurita.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadFiguritaRoute extends StatelessWidget {
  const UploadFiguritaRoute({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (ctx) {
        return BlocProvider(
          create: (_) => UploadFiguritaBloc(),
          child: const UploadFiguritaView(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const UploadFiguritaView();
  }
}