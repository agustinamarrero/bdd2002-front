import 'package:bdd2022/login/login.dart';
import 'package:bdd2022/ofert_someone/ofert_someone.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff891638),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                'packages/qatar_ui/assets/images/copa.png',
                height: 350.0,
                width: 200.0,
                fit: BoxFit.cover, //change image fill type
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: TextButton(
              onPressed: (() {
                Navigator.of(context).push(LoginRoute.route());
              }),
              style: TextButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: Colors.white,
                  disabledForegroundColor: Colors.white.withOpacity(0.38),
                  minimumSize: const Size(300, 40)),
              child: const Text(
                'Registrarse',
                style: TextStyle(
                  fontFamily: 'Qatar2022',
                  color: Color(0xff891638),
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextButton(
                onPressed: (() {
                  Navigator.of(context).push(OfertSomeoneRoute.route());
                }),
                style: TextButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.white,
                    disabledForegroundColor: Colors.white.withOpacity(0.38),
                    minimumSize: const Size(300, 40)),
                child: const Text(
                  'Ingresar',
                  style: TextStyle(
                    fontFamily: 'Qatar2022',
                    color: Color(0xff891638),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
