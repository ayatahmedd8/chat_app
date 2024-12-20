import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ChatBubble extends StatelessWidget {
  MessageModel messageModel;
  ChatBubble({
    super.key,
    required this.messageModel
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(left: 16,top: 30,bottom: 30,right: 30),
        margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
        decoration: const BoxDecoration(
            color: KprimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),
            )
        ),
        child: Text(
          messageModel.message,
          style:const  TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ChatBubbleForFriend extends StatelessWidget {
  MessageModel messageModel;
  ChatBubbleForFriend({
    super.key,
    required this.messageModel
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.only(left: 16,top: 30,bottom: 30,right: 30),
        margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
        decoration: const BoxDecoration(
            color: Color(0xff006D84),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32),
            )
        ),
        child: Text(
          messageModel.message,
          style:const  TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}