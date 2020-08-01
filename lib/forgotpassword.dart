import 'package:flutter/material.dart';
import './Animation/FadeAnimation.dart';

class forgotpassword extends StatefulWidget {
  @override
  _forgotpasswordState createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 150,
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
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FadeAnimation(
                  1,
                  Text(
                    "Forgot Password? \nDon't Worry!",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey[850],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
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
                        SizedBox(
                          height: 40.0,
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
                              hintText: "Email - ID",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 60.0,
                ),
                FadeAnimation(
                  1,
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 60),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromRGBO(49, 39, 79, 1),
                    ),
                    child: Center(
                      child: Text(
                        "Enter",
                        style: TextStyle(color: Colors.white),
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
