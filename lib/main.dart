import 'package:chat_flutter_websocket/pages/chat/home_mensager.dart';
import 'package:flutter/material.dart';

import 'pages/chat/chat_page.dart';
import 'pages/initial_page.dart';


void main() {
  runApp(const MaterialApp(home: ChatApp(),debugShowCheckedModeBanner: false,));
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Initial_Page(),
    );
  }
}
