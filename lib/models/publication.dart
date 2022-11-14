class Publication {
  final String namePlayer;
  final String statePublication;
  final String id;

  Publication(
    this.namePlayer,
    this.statePublication,
    this.id,
  );

  Publication.fromJson(Map<String, dynamic> json)
      : namePlayer = json['namePlayer'],
        statePublication = json['statePublication'],
        id = json['id'];

  Map<String, dynamic> toJson() => {
        'namePlayer': namePlayer,
        'statePublication': statePublication,
        'id': id,
      };
}
