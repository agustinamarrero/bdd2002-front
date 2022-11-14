import 'package:bdd2022/upload_figurita/upload_figurita.dart';

class Figure {
  final String numberPlayer;
  final EstadoFigurita stateFigure;

  Figure(
    this.numberPlayer,
    this.stateFigure,
  );

  Figure.fromJson(Map<String, dynamic> json)
      : numberPlayer = json['numberPlayer'],
        stateFigure = json['stateFigure'];

  Map<String, dynamic> toJson() => {
        'numberPlayer': numberPlayer,
        'stateFigure': stateFigure,
      };
}
