import 'package:flutter/material.dart';
import 'package:health_assistant/widgets/button_widget.dart';
import 'package:health_assistant/widgets/textfield_widget.dart';
import 'package:health_assistant/widgets/wave_widget.dart';

class forgotpassword extends StatefulWidget {
  @override
  _forgotpasswordState createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
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
              'Forgot Password?\nDont Worry!',
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
                  hintText:'Enter Email',
                  obscureText:false,
                  prefixIconData:Icons.mail_outline,
                ),
                SizedBox(height: 20,),
                ButtonWidget(
                  title:'Ger Password',
                  hasBorder:false,
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 140,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
