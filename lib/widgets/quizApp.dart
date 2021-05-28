import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/question.dart';

class QuizApp extends StatefulWidget {

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  Expanded questionsDisplay({qtn}) {
    return Expanded(
      flex: 4,
      child: Center(
        child: Text(
          qtn,
          style: TextStyle(
            fontSize: 20,
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
              fontSize: 30,
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

  List<Icon> scoreKeeper = [];

  List<Question> questionBank = [
    Question(questionText: 'Seahorses have stomachs for the absorption of nutrients from food.',questionAnswer: false),
    Question(questionText: 'The letter H is between letters G and J on a keyboard', questionAnswer: true),
    Question(questionText: 'Camels have three sets of eyelashes', questionAnswer: true),
    Question(questionText: 'There are five zeros in one hundred thousand', questionAnswer: true),
    Question(questionText: 'There are stars and zigzags on the flag of America', questionAnswer: false),
    Question(questionText: 'If you add the two numbers on the opposite sides of dice together, the answer is always 7', questionAnswer: true),
  ];

  List<bool> answers = [];

  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        questionsDisplay(qtn: questionBank[questionNumber].questionText),
        answerButton(
          buttonAction: () {
            bool correctAnswer = answers[questionNumber];
            if(correctAnswer == true){
              print('the answer is correct');
            }else{
              print('the answer is not correct');
            }
            setState(() {
              questionNumber++;
            });
        },
          color: Colors.green,
          text: 'True',
        ),
        answerButton(
          buttonAction: () {
            bool correctAnswer = questionBank[questionNumber].questionAnswer;

            if(correctAnswer == true){
              print('the answer is correct');
            }else{
              print('the answer is not correct');
            }
            setState(() {
              questionNumber++;
            });
          },
          color: Colors.red,
          text: 'False',),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
