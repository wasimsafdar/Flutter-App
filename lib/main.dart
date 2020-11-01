import 'package:FirstFlutterApp/question.dart';
import 'package:flutter/material.dart';
import 'package:FirstFlutterApp/answer.dart';
import './quiz.dart';
import './result.dart';


// void main(){
//   runApp(myFirstApp());
// }

void main() => runApp(myFirstApp());

//Every Widget in Flutter needs to extend Stateless Widget
// Each Widget class needs to call build method to draw something on the screen.
class myFirstApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _myFirstAppState(); //With "_" with class name makes it private
  }

}

//Stateless widget takes build function
//build function takes BuildContext as an argument
//build function is of type Widget because in Flutter everything is a Widget

class _myFirstAppState extends State<myFirstApp> {

  var _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 0},
        {'text': 'Red', 'score': 6},
        {'text': 'Green', 'score': 7}
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 8},
        {'text': 'Snake', 'score': 2},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Horse', 'score': 9}
      ],
    },
    {
      'questionText': 'What\'s your favourite fruit',
      'answers': [
        {'text': 'Apple', 'score': 10},
        {'text': 'Peach', 'score': 6},
        {'text': 'Banana', 'score': 3},
        {'text': 'Grape', 'score': 5}
      ],
    }
    //'What\'s your favorite color?',
    //'What\'s your favourite animal?'
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState((){
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    //SetState updates the widget by call build method again
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {

    }
  }

  @override
  Widget build(BuildContext context) {
    //It returns MaterialApp that draws widgets on screen
    //Home means main screen, and it prints Text Hello on main screen

    //return MaterialApp(home: Text('Hello'),);
    // void answerQuestion(){
    //   print('Answer Chosen!');
    // }


    //Scaffold is used to build the base page design of your app
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('This is my First App'),
        ),
        body: _questionIndex < _questions.length ? Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions) : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
