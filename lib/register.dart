import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_assistant/widgets/button_widget.dart';
import 'package:health_assistant/widgets/textfield_widget.dart';
import 'package:health_assistant/widgets/wave_widget.dart';

class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
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
              'Get Yourself,\nRegistered!',
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
                ),
                SizedBox(height: 10,),
                TextFieldWidget(
                      hintText:'Password',
                      obscureText:true,
                      prefixIconData:Icons.lock_outline,
                    ),
                SizedBox(height: 10,),
                TextFieldWidget(
                  hintText:'Conform Password',
                  obscureText:true,
                  prefixIconData:Icons.lock_outline,
                ),
                SizedBox(height: 20,),
                ButtonWidget(
                  title:'Register',
                  hasBorder:false,
                ),
                SizedBox(height: 70,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}