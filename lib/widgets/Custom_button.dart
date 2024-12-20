import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{

  String title;
  VoidCallback? onpressed;

  CustomButton({super.key, required this.title,this.onpressed});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 300,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 16,
              color: KprimaryColor,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}