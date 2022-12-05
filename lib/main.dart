import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:prueba/src/index.dart';
import 'package:prueba/src/login.dart'; // Add this line.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
        initialRoute: LoginPage.id,
        routes: {
          LoginPage.id: (context) => LoginPage(),
        
        });
  }
}
