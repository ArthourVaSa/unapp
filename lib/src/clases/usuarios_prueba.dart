// To parse this JSON data, do
//
//     final usuarioPrueba = usuarioPruebaFromJson(jsonString);

import 'dart:convert';

import 'package:unapp/src/preferencias/preferencias_usuario.dart';

final prefs = PreferenciasUsuario();
String tokens = prefs.token;

UsuarioPrueba usuarioPruebaFromJson(String str) =>
    UsuarioPrueba.fromJson(json.decode(str));

String usuarioPruebaToJson(UsuarioPrueba data) => json.encode(data.toJson());

class UsuarioPrueba {
  UsuarioPrueba({
    this.id,
    this.school,
    this.name,
    this.lastName,
    this.dni,
    this.email,
    this.password,
    this.token,
  });

  int id;
  List<School> school;
  String name;
  String lastName;
  String dni;
  String email;
  String password;
  String token;

  factory UsuarioPrueba.fromJson(Map<String, dynamic> json) => UsuarioPrueba(
        id: json["id"],
        school:
            List<School>.from(json["school"].map((x) => School.fromJson(x))),
        name: json["name"],
        lastName: json["last_name"],
        dni: json["dni"],
        email: json["email"],
        password: json["password"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "school": List<dynamic>.from(school.map((x) => x.toJson())),
        "name": name,
        "last_name": lastName,
        "dni": dni,
        "email": email,
        "password": password,
        "token": tokens,
      };
}

class School {
  School({
    this.name,
  });

  String name;

  factory School.fromJson(Map<String, dynamic> json) => School(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
