import 'package:Chat_App/chat/messages.dart';
import 'package:Chat_App/chat/new_messages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left:6.0),
            child:Container(child: Text('Mine Always ',style: GoogleFonts.lobsterTwo(textStyle: TextStyle(color: Colors.white ,fontSize: 22,letterSpacing: 1.8)),)),
          ),
          actions: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.call),color: Colors.pink[200], onPressed:(){}),
                  IconButton(icon: Icon(Icons.videocam), color: Colors.pink[200],onPressed:(){}),
                  Container(child: IconButton(icon: Icon(Icons.exit_to_app),color: Colors.white, onPressed:(){FirebaseAuth.instance.signOut();}))
                ],
              ),
            )
          ],
          backgroundColor: Color.fromRGBO(28, 28,28, 1),
        ),
        body: Container(
          color: Color.fromRGBO(0, 4, 14, 1),
          child: Column(
            children: <Widget>[
              Container(
                height: 0.1,
                color: Colors.white60,
              ),
              Expanded(child: Messages()),
              Container(
                height: 0.15,
                color: Colors.white60,
              ),
              NewMessages(),
            ],
          ),
        ),
      ),
    );
  }
}