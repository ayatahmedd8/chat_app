import 'package:chat_app/constants.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/ShowSnakBar.dart';
import '../widgets/Custom_button.dart';
import '../widgets/Custom_textformfield.dart';

class RegisterScreen extends StatefulWidget {
  static String id = 'SignUpScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;

  String? password;

  GlobalKey<FormState> formKey=GlobalKey();

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
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 1,
                ),
                Image.asset(Klogo,),
                const Text(
                  'Scholar Chat',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                ),
                const Spacer(
                  flex: 2,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'REGISTER',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                CustomTextFormField(
                  hintText: 'Email',
                  onchanged: (data) {
                    email = data;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  obscure: true,
                  hintText: 'Password',
                  onchanged: (data) {
                    password = data;
                  },
                ),
                const SizedBox(height: 40),
                CustomButton(
                  title: 'Register',
                  onpressed: () async {
                    if(formKey.currentState!.validate()) {
                      isloading=true;
                      setState(() {});
                      try {
                        await registerUser();
                        Navigator.pushNamed(context, ChatScreen.id);
                        //showSnakbar(context, 'Success');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnakbar(
                              context, 'The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          showSnakbar(context,
                              'The account already exists for that email.');
                        }
                      } catch (e) {
                        showSnakbar(context, 'There was an error!');
                      }
                      isloading=false;
                      setState(() {});
                    }else{}
                  },
                ),
                const SizedBox(height: 5),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text(
                    'Already have an account ',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white),
                    ),
                  ),
                ]),
                const Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<void> registerUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user =
        await auth.createUserWithEmailAndPassword(
            email: email!, password: password!);
    print(user.user!.displayName);
  }
}
