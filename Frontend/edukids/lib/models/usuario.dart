class User {
  int id;
  String nombre;
  String puntos;
  User({required this.id, required this.nombre, required this.puntos});

  factory User.fromJson(Map json){
    return User(
      id: json["user_id"],
      nombre: json["user_name"].toString(),
      puntos: json["user_puntos"].toString()
    );
  }
}
