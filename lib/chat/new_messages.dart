import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessages extends StatefulWidget {
  @override
  _NewMessagesState createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  final _controller = new TextEditingController();
  var _enteredMessage = '';
  void _sendMessage() async {
    FocusScope.of(context).unfocus();
    final user = await FirebaseAuth.instance.currentUser();
    Firestore.instance.collection('chat')
    .add({
    'Text':_enteredMessage,
    'createdAt':Timestamp.now(),
    'userId': user.uid,
    });
    _controller.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(0, 4, 14, 1),
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
      child: Row(
        children: <Widget>[
          IconButton(icon:Icon(Icons.photo_library), onPressed:(){},color: Colors.white,),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top:5,bottom:5,right:5,left:5),
              //height:40,
              decoration: BoxDecoration(
                color: Color.fromRGBO(18, 18, 18, 0),
              ),
              child: TextField(
              cursorColor: Colors.pink[400],  
              style: TextStyle(color: Colors.white.withOpacity(1)),  
              controller: _controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 14),
                hintText:'Type a message...',
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.2),
                 ),
                 filled: true, 
                 fillColor: Color.fromRGBO(18, 18, 18, 1),
                 focusedBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.transparent 
                    )
                  ),
                 enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.transparent                      
                    )
                  )
                ),
                onChanged: (value){
                  setState(() {
                    _enteredMessage = value;
                  });
                },
          ),
            )),
          IconButton(icon:Icon(Icons.keyboard_voice), onPressed:(){},color: Colors.pink[400],),
          Container(
            height: 40,
            margin: EdgeInsets.only(left:5,right: 10),
            decoration: BoxDecoration(
              color: Colors.pink[400],
              shape: BoxShape.circle
            ),
            child: Center(
              child: IconButton(icon:Icon(Icons.send),
              onPressed:_enteredMessage.trim().isEmpty ?(){}:
              (){
                _sendMessage();
              },
              color: Colors.white,),
            ),
          )
        ],
      ),
    );
  }
}