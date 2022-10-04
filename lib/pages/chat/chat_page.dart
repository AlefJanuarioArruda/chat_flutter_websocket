import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../components/input_message.dart';
import '../../components/list_message.dart';
import 'controllers/chat_controller.dart';


class ChatPage extends StatefulWidget {
  final String id;
  final String email;
  final String username;
  final String city;
  final String phone;
  final String zipcode;
  final String website;

  ChatPage(
      {Key? key, required this.id, required this.username, required this.city, required this.phone, required this.zipcode, required this.website, required this.email})
      : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ChatController controller = ChatController();

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat do Pub Dev'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListMessageView(
              messages: controller.messages,
            ),
          ),
          InputMessage(
              onSendMessage: controller.sendMessage,
              id: widget.id,
              email: widget.email,
              username: widget.username,
              city: widget.city,
              phone: widget.phone,
              zipcode: widget.zipcode,
              website: widget.website

          ),
        ],
      ),
    );
  }
}


Future PostWeb(id,email, username,mensagem, city, phone, zipcode, website) async {
  Uri uri = Uri.parse(
      'https://webhook.site/ccdada0f-c39e-4706-9f81-f8764caa866d');
  var client = http.Client();
  try {
    var response = await client.post(
        uri,
        body: jsonEncode({
          "message": {
            "id": id,
            "email":email,
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
        }
            )
    );

    print(response.body);
  } finally {
// client.close();
}


}
