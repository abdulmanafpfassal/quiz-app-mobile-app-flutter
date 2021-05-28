import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  Expanded questionsDisplay({question}) {
    return Expanded(
      flex: 4,
      child: Center(
        child: Text(
          question,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Expanded answerButton({buttonAction, color, text }) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: TextButton(
          onPressed: buttonAction,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.teal,
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor: color,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        questionsDisplay(question: 'how are you'),
        answerButton(buttonAction: () {}, color: Colors.green, text: 'True',),
        answerButton(buttonAction: () {}, color: Colors.red, text: 'False',),
        
      ],
    );
  }
}
