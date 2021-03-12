import 'package:flutter/material.dart';
import 'package:flutter_simple_quiz_app/answer.dart';
import 'package:flutter_simple_quiz_app/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> _questions;
  final int _questionIndex;
  final Function _cevapVer;

  Quiz({@required questions, @required questionIndex, @required cevapVer})
      : _questions = questions,
        _questionIndex = questionIndex,
        _cevapVer = cevapVer;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Question(
          _questions[_questionIndex]["questionText"],
        ),
        ...(_questions[_questionIndex]['answers'] as List<Map<String, Object>>)
            .map(
          (answer) {
            return Answer(() => _cevapVer(answer['s']), answer['t']);
          },
        ).toList(),
      ],
    );
  }
}
