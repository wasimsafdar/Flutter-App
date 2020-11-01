import 'package:FirstFlutterApp/question.dart';
import 'package:flutter/material.dart';
import 'answer.dart';
import './question.dart';

class Quiz extends StatelessWidget{

  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;

  Quiz({@required this.questions,@required this.answerQuestion,@required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answers'] as List<Map<String,Object>>).map((answer){
          return Answer(()=>answerQuestion(answer['score']),answer['text']);
        }).toList()
        //Answer(_answerQuestion),
        //Answer(_answerQuestion),
        //Answer(_answerQuestion),
        /*
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: _answerQuestion, //Here we are passing the name of the function not the function
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: ()=> print('Answer 2 chosen'),
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed:  () {
                  print('Answer 3 chosen');
             */
        //},
        //),
      ],
    );
  }

}