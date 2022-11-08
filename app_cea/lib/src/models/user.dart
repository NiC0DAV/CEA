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
  String? telefono;
  String? celular;
  String? tipoUsuario;

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
  };
}
