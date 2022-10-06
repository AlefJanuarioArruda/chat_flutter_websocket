import 'dart:io';
import 'package:chat_flutter_websocket/services/PostWebhook.dart';
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
      color: Colors.transparent,
      margin: EdgeInsets.only(bottom: 20,left: 30,right: 20),
      //height: 61,
      child: Column(
        children: [
          Row(
            children: [



              Expanded(
                child: GestureDetector(
                  onTap: (){
                        setState(() {
                 emojiShowing = false;
                         });


                  },
                  child: Container(

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 3),
                            blurRadius: 5,
                            color: Colors.grey)
                      ],
                    ),
                    child: Center(
                      child: TextField(
                        //expands: true,
                        //scribbleEnabled: ,
                      //enabled: emojiShowing = false,
                       style: TextStyle(
                         decorationColor: Colors.grey,
                         //: false,
                            fontSize: 20.0, color: Colors.black),
                        decoration: InputDecoration(
                          disabledBorder: InputBorder.none ,
                          prefixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                emojiShowing = !emojiShowing;
                                FocusManager.instance.primaryFocus?.unfocus();
                              });
                            },
                            icon: Icon(
                              Icons.insert_emoticon_outlined,
                              size: 30,
                              color: Colors.blue[900],
                            ),
                          ),

                            hintText: "Mensagem...",
                            hintStyle: TextStyle( fontSize: 20,color:Colors.blueGrey,),
                            border: InputBorder.none),
                        controller: controller,
                        maxLines: 1,
                        onTap: (){
                          setState(() {
                            emojiShowing = false;
                          });
                        },
                        onChanged: (message) {
                          emojiShowing = false;
                          _message = message;
                        },
                        onSubmitted: (_) => _sendMessage(),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10,),
              IconButton(
                onPressed: () {
                  emojiShowing = false;
                  _sendMessage();
                  PostWeb(widget.id, widget.email, widget.username, _message,
                      widget.city, widget.phone, widget.zipcode, widget.website);
                },
                icon:  Icon(Icons.send,size: 25,color: Colors.blue[900],),
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
                      emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                      verticalSpacing: 0,
                      horizontalSpacing: 0,
                      gridPadding: EdgeInsets.zero,
                      initCategory: Category.RECENT,
                      bgColor: Colors.transparent,
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
