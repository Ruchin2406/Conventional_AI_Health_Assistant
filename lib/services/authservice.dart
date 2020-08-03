import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService{
  Dio dio = new Dio();
  
  login(email,password) async {
    try{
      return await dio.post('https://conventional-ai-health-assista.herokuapp.com/authenticate',data:{
        "email":email,
        "password":password
      },options : Options(contentType: Headers.formUrlEncodedContentType)
      );
    }
    on DioError catch(e){
      Fluttertoast.showToast(
        msg: e.response.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 10.0
      );
    }
  }
}