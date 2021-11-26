// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    this.apellido,
    this.dni,
    this.nombre,
  });

  String apellido;
  int dni;
  String nombre;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        apellido: json["apellido"],
        dni: json["dni"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "apellido": apellido,
        "dni": dni,
        "nombre": nombre,
      };
}
