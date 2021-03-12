import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int _score;
  final Function _resartQuiz;

  Result({@required score, @required resartQuiz})
      : _score = score,
        _resartQuiz = resartQuiz;

  var styl = TextStyle(fontSize: 36, fontWeight: FontWeight.bold);

  String get score {
    String resultMsg;
    if (_score <= 8) {
      resultMsg = "You are awesome ,score:$_score";
    } else if (_score <= 12) {
      resultMsg = "Pretty likeable ,score:$_score";
    } else if (_score <= 18) {
      resultMsg = "You are ... strange ?! ,score:$_score";
    } else {
      resultMsg = "You are so bad ! ,score:$_score";
    }
    return resultMsg;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "QUIZ FINISED !",
            style: styl,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            score,
            style: styl,
            textAlign: TextAlign.center,
          ),
          OutlinedButton(
              onPressed: _resartQuiz,
              child: Text(
                "Restart Quiz",
              ),
              style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.deepPurple, width: 2))),
        ],
      ),
    );
  }
}
