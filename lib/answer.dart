import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answer;

  Answer(this.selectHandler, this.answer);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      child: ElevatedButton(
          onPressed: selectHandler,
          child: Text(answer),
          style: ElevatedButton.styleFrom(primary: Colors.deepOrange)),
    );
  }
}
