import 'dart:convert';
import 'package:http/http.dart' as http;
import '../services/Encode/Encripyt.dart';


Future PostWeb(
    id, email, username, mensagem, city, phone, zipcode, website) async {
  String Api = Encode().decodeUSerServices();
  Uri uri =
  Uri.parse(Api);
  var client = http.Client();
  try {
    var response = await client.post(uri,
        body: jsonEncode({
          "message": {
            "id": id,
            "email": email,
            "username": username,
            "mensagem": mensagem,
            "type": "regular",
          },
          "user": {
            "id": id,
            "city": city,
            "zipcode": zipcode,
            "online": true,
            "phone": phone,
          },
          "channel": {
            "website": website,
          }
        }));

    print(response.body);
  } finally {
// client.close();
  }

}