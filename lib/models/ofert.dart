class Oferts {
  final String state_damage;
  final String email;
  final String number;
  final int quantity;
  final String description;

  Oferts(
    this.state_damage,
    this.email,
    this.number,
    this.quantity,
    this.description,
  );

  Oferts.fromJson(Map<String, dynamic> json)
      : state_damage = json['state_damage'],
        email = json['email'],
        number = json['number'],
        quantity = json['quantity'],
        description = json['description'];

  // Map<String, dynamic> toJson() => {
  //       'namePlayer': namePlayer,
  //       'nameUser': nameUser,
  //       'state': state,
  //     };
}
