import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/quizApp.dart';

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: QuizApp(),
          ),
        ),
      ),
    );
  }
}
