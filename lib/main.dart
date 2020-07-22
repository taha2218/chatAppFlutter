import 'package:Chat_App/screens/auth_screen.dart';
import 'package:Chat_App/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(stream: FirebaseAuth.instance.onAuthStateChanged, builder:(ctx,userSnapshot){
        if (userSnapshot.hasData)
          return ChatScreen();
        else
          return AuthScreen();
      }),
    );
  }
}