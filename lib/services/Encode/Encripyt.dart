
import 'dart:convert';
class Encode {
  String DecodedWebhook() {
    String encoded = base64Url.encode(utf8.encode(
        "https://webhook.site/7313dac2-122e-4be5-b649-4de97fce411d"));
    // print(encoded);
    final decoded = utf8.decode(base64Url.decode(encoded));

    return decoded;
  }

  String decodeUSerServices() {
    String encoded = base64Url.encode(
        utf8.encode("https://jsonplaceholder.typicode.com/users"));

    final decoded = utf8.decode(base64Url.decode(encoded));

    return decoded;
  }

  String decodedMensagens() {
    String encoded = base64Url.encode(utf8.encode(
        "wss://demo.piesocket.com/v3/channel_1?api_key=VCXCEuvhGcBDP7XhiJJUDvR1e1D3eiVjgZ9VRiaV"));
    final decoded = utf8.decode(base64Url.decode(encoded));

    return decoded;
  }
}