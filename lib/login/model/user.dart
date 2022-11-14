class User {
  final String name;
  final String email;
  final String lastname;
  final String ci;
  final String phone;
  final String password;

  User(
    this.name,
    this.email,
    this.ci,
    this.lastname,
    this.phone,
    this.password,
  );

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        phone = json['phone'],
        ci = json['ci'],
        lastname = json['lastname'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
        'ci': ci,
        'lastname': lastname,
        'password': password,
      };
}
