import 'dart:convert';
import 'package:http/http.dart' as http;
import '../services/Encode/Encripyt.dart';


Future<List<Usuario>?> getUsuarios() async {
  String Api = Encode().decodeUSerServices();
  Uri uri = Uri.parse(Api);
  var response = await http.get(uri);
  var dados = json.decode(response.body) as List;
  List<Usuario> usuarios = [];
  dados.forEach((element) {
    Usuario usuario = Usuario(
        element["id"],
        element["name"],
        element["username"],
        element["email"],
        element["address"]["street"],
        element["address"]["suite"],
        element["address"]["city"],
        element["address"]["zipcode"],
        element["address"]["geo"]["lat"],
        element["address"]["geo"]["lng"],
        element["phone"],
        element["website"],
        element["company"]["name"],
        element["company"]["catchPhrase"],
        element["company"]["bs"]);

    usuarios.add(usuario);
  });
  return usuarios;
}

class Usuario {
  final int id;
  final String name;
  final String username;
  final String email;
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final String lat;
  final String lng;
  final String phone;
  final String website;
  final String segundonome;
  final String catchPhrase;
  final String bs;


  Usuario(
      this.id,
      this.name,
      this.username,
      this.email,
      this.street,
      this.suite,
      this.city,
      this.zipcode,
      this.lat,
      this.lng,
      this.phone,
      this.website,
      this.segundonome,
      this.catchPhrase,
      this.bs,
      );

  factory Usuario.fromjson(Map<String, dynamic> json) {
    return Usuario(
      json["id"],
      json["name"],
      json["username"],
      json["email"],
      json["street"],
      json["suite"],
      json["city"],
      json["zipcode"],
      json["lat"],
      json["lng"],
      json["phone"],
      json["website"],
      json["name"],
      json["catchPhrase"],
      json["bs"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": this.id,
    "name": this.name,
    "username": this.username,
    "email": this.email,
    "street": this.street,
    "suite": this.suite,
    "city": this.city,
    "zipcode": this.zipcode,
    "lat": this.lat,
    "lng": this.lng,
    "phone": this.phone,
    "website": this.website,
    "name": this.segundonome,
    "catchPhrase": this.catchPhrase,
    "bs": this.bs,
  };
}
