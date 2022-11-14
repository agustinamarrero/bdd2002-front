class Oferts {
  final String namePlayer;
  final int state;
  final String nameUser;

  Oferts(
    this.namePlayer,
    this.nameUser,
    this.state,
  );

  Oferts.fromJson(Map<String, dynamic> json)
      : namePlayer = json['namePlayer'],
        nameUser = json['nameUser'],
        state = json['state'];

  Map<String, dynamic> toJson() => {
        'namePlayer': namePlayer,
        'nameUser': nameUser,
        'state': state,
      };
}
