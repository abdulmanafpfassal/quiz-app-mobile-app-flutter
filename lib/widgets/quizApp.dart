import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_Brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

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

  Expanded answerButton({buttonAction, color, text}) {
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

  void checkUserAnswer(bool checkUserAnswer){
    bool correctAnswer =  quizBrain.getCorrectAnswer();
    setState(() {
      if(quizBrain.isFinished()){
        Alert(
          context: context,
          type: AlertType.error,
          title: 'Finished',
          desc: 'The Quiz has been ended.',
        ).show();
        quizBrain.reset();
        scoreKeeper = [];
      }else {
        if (checkUserAnswer == correctAnswer) {
          scoreKeeper.add(
              Icon(Icons.check, color: Colors.green,));
        } else {
          scoreKeeper.add(
              Icon(Icons.close, color: Colors.red,));
        }
        quizBrain.nextQuestion();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        questionsDisplay(
            qtn: quizBrain.getTheQuestions()),
        answerButton(
          buttonAction: () {
            checkUserAnswer(true);
          },
          color: Colors.green,
          text: 'True',
        ),
        answerButton(
          buttonAction: () {
            checkUserAnswer(false);
          },
          color: Colors.red,
          text: 'False',
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
