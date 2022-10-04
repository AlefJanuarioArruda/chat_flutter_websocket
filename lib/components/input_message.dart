import 'dart:io';

import 'package:chat_flutter_websocket/pages/chat/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
class InputMessage extends StatefulWidget {
  final String id;
  final String email;
  final String username;
  final String city;
  final String phone;
  final String zipcode;
  final String website;

  InputMessage({
    Key? key,
    required this.onSendMessage,
    required this.id,
    required this.username,
    required this.city,
    required this.phone,
    required this.zipcode,
    required this.website,
    required this.email,
  }) : super(key: key);

  final void Function(String) onSendMessage;

  @override
  State<InputMessage> createState() => _InputMessageState();
}

class _InputMessageState extends State<InputMessage> {
  String _message = '';
  TextEditingController controller = TextEditingController();
  bool emojiShowing = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 234, 234, 234),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    emojiShowing = !emojiShowing;
                  });
                },
                icon: const Icon(
                  Icons.emoji_emotions,
                  color: Colors.black,
                ),
              ),

              Expanded(
                child: TextField(
                 style: TextStyle(
                      fontSize: 20.0, color: Colors.black87),
                  decoration: InputDecoration(
                    hintText: 'Type a message',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(
                        left: 16.0,
                        bottom: 8.0,
                        top: 8.0,
                        right: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  controller: controller,
                  maxLines: 1,
                  onChanged: (message) {
                    emojiShowing = false;
                    _message = message;
                  },
                  onSubmitted: (_) => _sendMessage(),
                ),
              ),
              IconButton(
                onPressed: () {
                  emojiShowing = false;
                  _sendMessage();
                  PostWeb(widget.id, widget.email, widget.username, _message,
                      widget.city, widget.phone, widget.zipcode, widget.website);
                },
                icon: const Icon(Icons.send),
              ),
            ],
          ),
          Offstage(
              offstage: !emojiShowing,
              child: SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: EmojiPicker(
                    textEditingController: controller,
                    config: Config(
                      columns: 7,
                      // Issue: https://github.com/flutter/flutter/issues/28894
                      emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                      verticalSpacing: 0,
                      horizontalSpacing: 0,
                      gridPadding: EdgeInsets.zero,
                      initCategory: Category.RECENT,
                      bgColor: const Color(0xFFF2F2F2),
                      indicatorColor: Colors.blue,
                      iconColor: Colors.grey,
                      iconColorSelected: Colors.blue,
                      backspaceColor: Colors.blue,
                      skinToneDialogBgColor: Colors.white,
                      skinToneIndicatorColor: Colors.grey,
                      enableSkinTones: true,
                      showRecentsTab: true,
                      recentsLimit: 28,
                      replaceEmojiOnLimitExceed: false,
                      noRecents: const Text(
                        'No Recents',
                        style: TextStyle(fontSize: 20, color: Colors.black26),
                        textAlign: TextAlign.center,
                      ),
                      loadingIndicator: const SizedBox.shrink(),
                      tabIndicatorAnimDuration: kTabScrollDuration,
                      categoryIcons: const CategoryIcons(),
                      buttonMode: ButtonMode.MATERIAL,
                      checkPlatformCompatibility: true,
                    ),
                  ))),
        ],
      ),
    );
  }

  void _sendMessage() {
    widget.onSendMessage(_message);
    controller.text = '';
  }
}
