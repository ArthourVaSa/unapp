// To parse this JSON data, do
//
//     final facultades = facultadesFromJson(jsonString);

import 'dart:convert';

Facultades facultadesFromJson(String str) =>
    Facultades.fromJson(json.decode(str));

String facultadesToJson(Facultades data) => json.encode(data.toJson());

class Facultades {
  Facultades({
    this.facen,
    this.fia,
    this.fiq,
    this.fisi,
  });

  String facen;
  String fia;
  String fiq;
  String fisi;

  factory Facultades.fromJson(Map<String, dynamic> json) => Facultades(
        facen: json["Facen"],
        fia: json["Fia"],
        fiq: json["Fiq"],
        fisi: json["Fisi"],
      );

  Map<String, dynamic> toJson() => {
        "Facen": facen,
        "Fia": fia,
        "Fiq": fiq,
        "Fisi": fisi,
      };
}
