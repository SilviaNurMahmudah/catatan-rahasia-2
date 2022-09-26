import 'package:flutter/material.dart';
import 'package:catatan_rahasia/src/animation.dart';
import 'package:catatan_rahasia/src/catatan.dart';
import 'package:catatan_rahasia/src/login.dart';

void main() {

  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/' : (context) => const LogoApp(),
      '/login' : (context) => const Login(),
      '/note' : (context) => const Catatan() 
    },
  ));
}