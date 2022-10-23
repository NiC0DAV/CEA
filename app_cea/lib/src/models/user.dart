// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {

  String? userId;
  String? tipoDocumento;
  String? nombres;
  String? apellidos;
  String? direccion;
  String? correoElectronico;
  String? contrasena;
  int? telefono;
  int? celular;
  String? tipoUsuario;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.userId,
    this.tipoDocumento,
    this.nombres,
    this.apellidos,
    this.direccion,
    this.correoElectronico,
    this.contrasena,
    this.telefono,
    this.celular,
    this.tipoUsuario,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["userId"],
    tipoDocumento: json["tipo_documento"],
    nombres: json["nombres"],
    apellidos: json["apellidos"],
    direccion: json["direccion"],
    correoElectronico: json["correo_electronico"],
    contrasena: json["contrasena"],
    telefono: json["telefono"],
    celular: json["celular"],
    tipoUsuario: json["tipo_usuario"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "tipo_documento": tipoDocumento,
    "nombres": nombres,
    "apellidos": apellidos,
    "direccion": direccion,
    "correo_electronico": correoElectronico,
    "contrasena": contrasena,
    "telefono": telefono,
    "celular": celular,
    "tipo_usuario": tipoUsuario,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
