import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthForm extends StatefulWidget {

  AuthForm(this.submitFn);

  final void Function(String email,String userName,String password,bool isLogins) submitFn;


  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var isLogin = false ;
  var _mailAddress = '';
  var _userName = '';
  var _userPassword = '';

  void _trySubmit(){
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid){
      _formKey.currentState.save();
      widget.submitFn(
        _mailAddress.trim(),
        _userName.trim(),
        _userPassword.trim(),
        isLogin
      );
    }
    else{

    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(28),
        padding: EdgeInsets.all(28),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[    
              Container(child: Text('Tarah',style: GoogleFonts.lobsterTwo(textStyle: TextStyle(color: Colors.pinkAccent[400] ,fontSize: 40)),)),
              SizedBox(height: 80,),
              TextFormField(
                key: ValueKey('email'),
                onSaved: (value){_mailAddress=value;},
                validator: (value){
                  if (value.isEmpty || !value.contains('@'))
                    return 'Invalid email address !';
                  else
                    return null ;  
                },
                style: TextStyle(
                  color: Color.fromRGBO(92, 167, 227, 1)
                ),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: Colors.white38
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  focusedBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
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
              ),
              SizedBox(height: 15,),
              if(!isLogin)
              TextFormField(
                key: ValueKey('username'),
                onSaved: (value){_userName=value;},
                validator: (value){
                  if (value.isEmpty || value.length<4)
                    return 'Username length less than 4 !';
                  else
                    return null ;  
                },
                style: TextStyle(
                  color: Color.fromRGBO(92, 167, 227, 1)
                ),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                  hintText: 'Username',
                  hintStyle: TextStyle(
                    color: Colors.white38
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  focusedBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
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
              ),
              if(!isLogin)
              SizedBox(height: 15,),
              TextFormField(
                key: ValueKey('password'),
                onSaved: (value){_userPassword=value;},
                validator: (value){
                  if (value.isEmpty || value.length<7)
                    return 'Password length less than 8 !';
                  else
                    return null ;  
                },
                style: TextStyle(
                  color: Color.fromRGBO(92, 167, 227, 1)
                ),
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: Colors.white38
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  focusedBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
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
              ),
              SizedBox(height: 60,),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(colors: [Colors.amber[400],Colors.orange[900],])
                  ),
                  height: 50,
                  width: double.infinity,
                  child: InkWell(
                  onTap: (){_trySubmit();print('Clicked');},
                  child: Center(child: Text(isLogin?'Log In':'Sign Up',style: TextStyle(color: Colors.white,fontSize: 18),)),
                ),
              ),
              SizedBox(height: 13,),
              InkWell(
                onTap: (){ setState(() {
                  isLogin = !isLogin;
                }); },
                child: Text(isLogin?'Don\'t have an account ?  Sign Up ':'Already have an account ?  Log in ',style: TextStyle(color: Colors.lightBlue[200].withOpacity(0.3),letterSpacing: 1),),
              )
            ],
           ),
         ),
        ),
      ),
    );
  }
}