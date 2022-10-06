import 'package:flutter/material.dart';
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
      {Key? key,
      required this.id,
      required this.username,
      required this.city,
      required this.phone,
      required this.zipcode,
      required this.website,
      required this.email})
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
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: const Text(
          'Dashboard',
          style:
              TextStyle(fontSize: 17, color: Colors.white, letterSpacing: 0.53),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.subject,
            color: Colors.white,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications,
                size: 20,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
            child: Center(child: getAppBottomView()), preferredSize: const Size.fromHeight(110.0)),
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
              website: widget.website),
        ],
      ),
    );
  }
  Widget getAppBottomView() {
    return Container(
      padding: const EdgeInsets.only(left: 30, bottom: 20),
      child: Row(
        children: [
          getProfileView(),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.username,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                Text(
                  widget.email,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
                Text(
                  widget.phone,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget getProfileView() {
  return Stack(
    children: [
      const CircleAvatar(
        radius: 32,
        backgroundColor: Colors.white,
        child: Icon(Icons.person_outline_rounded),
      ),

    ],
  );
}
