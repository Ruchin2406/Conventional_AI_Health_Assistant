import 'package:flutter/material.dart';
import 'register.dart';
import 'login.dart';
import 'forgotpassword.dart';

void main() => runApp(
  MaterialApp(
    initialRoute: '/login',
    routes: {
      '/login':(context) => Login(),
      '/register':(context) => register(),
      '/forgotpassword':(context) => forgotpassword(),
    },
  ),
);