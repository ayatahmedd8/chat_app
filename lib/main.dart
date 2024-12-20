import 'package:chat_app/screens/Register_screen.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebase_options.dart';
import 'screens/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        // theme: ThemeData.dark().copyWith(
        //     scaffoldBackgroundColor: const Color(0xff100B20),
        //     textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)
        // ),
        routes: {
          LoginScreen.id : (context)=>LoginScreen(),
          RegisterScreen.id: (context)=>RegisterScreen(),
          ChatScreen.id: (context)=>ChatScreen(),
        },
        initialRoute: 'LoginScreen'
    );
  }
}
