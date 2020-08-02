import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_assistant/services/authservice.dart';
import './Animation/FadeAnimation.dart';
import 'register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  var email, password, token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 200,
            child: Stack(
              children: <Widget>[
                Positioned(
                    child: FadeAnimation(
                      1,
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/1.png"),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FadeAnimation(
                  1,
                  Text(
                    "Hello there, \nwelcome back",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey[850],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                FadeAnimation(
                  1,
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.transparent,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email-ID",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onChanged: (val){
                              email = val;
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey)
                            ),
                            onChanged: (val){
                              password = val;
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/forgotpassword');
                  },
                  child: Center(
                    child: FadeAnimation(
                      1,
                      Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.pink[200],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                FadeAnimation(
                  1,
                  GestureDetector(
                    onTap: (){
                      AuthService().login(email, password).then((val){
                        if(val.data['success']){
                          token = val.data['token'];
                          Fluttertoast.showToast(
                              msg: 'user exist',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.amber,
                              textColor: Colors.white,
                              fontSize: 10.0
                          );
                        }
                      });
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 60),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromRGBO(49, 39, 79, 1),
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                FadeAnimation(
                  1,
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          color: Colors.pink[200],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}