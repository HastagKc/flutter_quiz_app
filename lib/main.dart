import 'package:flutter/material.dart';
import 'package:quiz_app/screens/home_page.dart';
import 'package:quiz_app/screens/quiz_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizScreen(),
      // home: HomePage(),
    );
  }
}
