class PublicationGeneral {
  final String stateFigure;
  final String description;
  final String nameUser;
  final String id;

  PublicationGeneral(
    this.stateFigure,
    this.description,
    this.id,
    this.nameUser,
  );

  PublicationGeneral.fromJson(Map<String, dynamic> json)
      : stateFigure = json['stateFigure'],
        description = json['description'],
        nameUser = json['nameUser'],
        id = json['id'];

  Map<String, dynamic> toJson() => {
        'stateFigure': stateFigure,
        'description': description,
        'nameUser': nameUser,
        'id': id,
      };
}
