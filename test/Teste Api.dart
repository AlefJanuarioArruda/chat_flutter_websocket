import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;
String decoded(){
  String encoded = base64Url.encode(utf8.encode("https://webhook.site/ccdada0f-c39e-4706-9f81-f8764caa866d"));
  // print(encoded);
  final decoded = utf8.decode(base64Url.decode(encoded));

  return decoded;

}
Future<void> main () async {
  String decoded(){
    String encoded = base64Url.encode(utf8.encode("https://webhook.site/ccdada0f-c39e-4706-9f81-f8764caa866d"));
    // print(encoded);
    final decoded = utf8.decode(base64Url.decode(encoded));

    return decoded;

  }
  String Api;
   Api = decoded();
  Uri uri = Uri.parse(Api);
  var client = http.Client();
  try {
    var response = await client.post(
        uri,
        body: jsonEncode({
          "message":{
            "id":"1",
            "text":"hello, here's my CC information 1234 1234 1234 1234",
            "html":"",
            "type":"regular",
            "attachments":[],
            "latest_reactions":[],
            "own_reactions":[],
            "reaction_counts":null,
            "reaction_scores":null,
            "reply_count":0,
            "mentioned_users":[],
            "silent":false
          },
          "user":{
            "id":"17f8ab2c-c7e7-4564-922b-e5450dbe4fe7",
            "role":"user",
            "banned":false,
            "online":false
          },
          "channel":{
            "cid":"messaging:fun-01dce6d9-c6c8-4b59-8e3c-c31631e1f7c8",
            "id":"fun-01dce6d9-c6c8-4b59-8e3c-c31631e1f7c8",
            "type":"messaging",
            "last_message_at":"2020-06-18T14:10:30.823058Z",
            "created_at":"2020-06-18T14:10:29.457799Z",
            "updated_at":"2020-06-18T14:10:29.457799Z",
            "frozen":false,
            "config":{
              "created_at":"2020-06-18T14:10:29.494022Z",
              "updated_at":"2020-06-18T14:10:29.504722Z",
              "name":"messaging",
              "typing_events":true,
              "read_events":true,
              "connect_events":true,
              "search":true,
              "reactions":true,
              "replies":true,
              "mutes":true,
              "uploads":true,
              "url_enrichment":true,
              "message_retention":"infinite",
              "max_message_length":5000,
              "automod":"disabled",
              "automod_behavior":"flag",
              "commands":[]
            }
          }
        })
    );

    ///print(response.body);

  } finally {
    // client.close();
  }



}
class Teste{
  final String um;
  final String dois;
  final String tres;

  Teste(this.um, this.dois, this.tres);



}