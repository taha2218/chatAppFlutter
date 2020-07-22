import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageBubble extends StatelessWidget {

  final String text;
  final Key key;
  final bool isMe;

  MessageBubble(this.text,this.isMe,{this.key});

  @override
  Widget build(BuildContext context) {
    print(isMe);
    return Row(
      mainAxisAlignment: isMe?MainAxisAlignment.end:MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 10,right: isMe?16:0,left:isMe?0:16 ),
          constraints: BoxConstraints(maxWidth: 280),
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: isMe ? Colors.pink[200]: Color.fromRGBO(38, 38, 38, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft:Radius.circular(16),
              bottomRight: Radius.circular(16)
            )
          ),
          child:Text(text,textAlign: TextAlign.start,style: TextStyle(color: Colors.white,),)
        ),
      ],
    );
  }
}