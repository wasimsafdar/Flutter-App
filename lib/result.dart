import 'package:flutter/material.dart';

class Result extends StatelessWidget {

  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText = "You did it";

    if (resultScore <= 8) {
      resultText = "You are awesome";
    } else if (resultScore <= 12) {
      resultText = "You are good";
    } else if (resultScore <= 16) {
      resultText = "You are excellent";
    } else {
      resultText = "You are bad";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(child: Text('Restart Quiz'),onPressed: resetHandler,),
        ],
    ),
    );
  }
}
