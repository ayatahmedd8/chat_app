import 'package:chat_app/constants.dart';
import 'package:chat_app/screens/Register_screen.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/widgets/Custom_button.dart';
import 'package:chat_app/widgets/Custom_textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/ShowSnakBar.dart';

class LoginScreen extends StatefulWidget {
  static String id='LoginScreen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;
  GlobalKey<FormState> formkey=GlobalKey();
  bool isloading=false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: KprimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Form(
            key: formkey,
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(flex: 1,),
                    Image.asset(Klogo),
                    const Text(
                      'Scholar Chat',
                       style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.white,
                         fontStyle: FontStyle.italic
                      ),
                    ),
                    const Spacer(flex: 2,),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                            'LOGIN',
                             style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                               color: Colors.white,
                            ),
                          ),
                    ),
                    const SizedBox(height: 15),
                     CustomTextFormField(hintText: 'Email',onchanged: (data){
                       email=data;
                     },),
                    const SizedBox(height: 20),
                     CustomTextFormField(hintText: 'Password',onchanged: (data){
                       password=data;
                     }, obscure: true,),
                    const SizedBox(height: 40),
                     CustomButton(
                       title: 'Login',
                       onpressed: () async {
                         if(formkey.currentState!.validate()) {
                           isloading=true;
                           setState(() {});
                           try {
                             await loginUser();
                             Navigator.pushNamed(context, ChatScreen.id, arguments: email);
                             //showSnakbar(context, 'Success');
                           } on FirebaseAuthException catch (e) {
                             if (e.code == 'user-not-found') {
                               showSnakbar(context, 'No user found for that email.');
                             } else if (e.code == 'wrong-password') {
                               showSnakbar(context, 'Wrong password provided for that user.');
                             }
                           } catch (e) {
                             print(e);
                             showSnakbar(context, 'There was an error!');
                           }
                           isloading=false;
                           setState(() {});
                         }else{}
                       },
                     ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       const Text(
                      'Don\'t have an account?',
                         style: TextStyle(
                           color: Colors.white
                         ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterScreen.id);
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white
                         ),
                        ),
                       ),
                      ]
                    ),
                    const Spacer(flex: 3,),
                  ],
                ),
             ),
          ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
