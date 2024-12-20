import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget{

   String? hintText;
  Function(String)? onchanged;
   bool? obscure;
   CustomTextFormField({super.key,this.hintText, this.onchanged, this.obscure=false});
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      obscureText: obscure!,
      validator: (data){
        if(data!.isEmpty){
          return  'field is required';
        }
      },
      onChanged: onchanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:const TextStyle(
            color: Colors.white,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 10.0, 20.0, 10.0),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(60),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(60),
          ),
        ),
    );
  }
}