import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_assistant/services/authservice.dart';
import 'package:health_assistant/widgets/button_widget.dart';
import 'package:health_assistant/widgets/textfield_widget.dart';
import 'package:health_assistant/widgets/wave_widget.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  var email, password, token;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final bool keyboardopen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height-200,
            color: Colors.blue,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOutQuad,
            top: keyboardopen? -size.height/3.7 : 0.0,
            child: WaveWidget(
              size:size,
              yOffset:size.height/3.0,
              color:Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0,left: 20.0),
            child: Text(
              'Hello There,\nWelcome Back!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[

                TextFieldWidget(
                  hintText:'Email',
                  obscureText:false,
                  prefixIconData:Icons.mail_outline,
                  onChanged: (val){
                    email = val;
                  },
                ),
                SizedBox(height: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextFieldWidget(
                      hintText:'Password',
                      obscureText:true,
                      prefixIconData:Icons.lock_outline,
                      onChanged: (val){
                        password = val;
                      },
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/forgotpassword');
                      },
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    AuthService().login(email, password).then((val){
                      if(val.data['success']){
                        token = val.data['token'];
                        Fluttertoast.showToast(
                          msg: 'user exist',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          fontSize: 10.0,
                        );
                        Navigator.pushNamed(context, '/home');
                      }
                    });
                  },
                  child: ButtonWidget(
                    title:'Login',
                    hasBorder:false,
                  ),
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 70,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}