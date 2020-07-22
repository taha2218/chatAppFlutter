import 'package:Chat_App/widgets/auth_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  final _auth = FirebaseAuth.instance;

  void _submitAuthForm(
    String email,
    String userName,
    String password,
    bool isLogin,
    ) async {
      AuthResult authResult;
      try{
        if(isLogin){
          authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
        }   else{
          authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
          await Firestore.instance.collection('users').document(authResult.user.uid).setData({'username':userName,'email':email});
          }
        } on PlatformException catch(err) {
          var message = 'An error occurred, please check your credentials !'; 
          if (err.message != null){
            message = err.message;
          }
          Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
        } catch (err){
          print(err); 
        }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        backgroundColor: Color.fromRGBO(5, 30, 52, 1),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color.fromRGBO(0, 12, 48, 1),Color.fromRGBO(0, 4, 10, 1)],)
          ),
          height: double.infinity,
          width: double.infinity,
          child: AuthForm(_submitAuthForm),
        ),
      ),
    );
  }
}