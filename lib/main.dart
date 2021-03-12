import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_quiz_app/answer.dart';
import 'package:flutter_simple_quiz_app/quiz.dart';
import 'package:flutter_simple_quiz_app/result.dart';
import 'question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Quiz Screen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _qIndex = 0;

  var _totalScore = 0;

  void _cevapVer(int score) {
    if (_qIndex < _questions.length) {
      setState(() {
        _totalScore += score;
        _qIndex = _qIndex + 1;
        print("qIndex : $_qIndex ");
      });
    }
  }

  void _resartQuiz() {
    setState(() {
      _qIndex = 0;
      _totalScore = 0;
    });
  }

  var _questions = [
    {
      "questionText": "En sevdiğin renk ne ?",
      "answers": [
        {"t": "Siyah", 's': 10},
        {'t': "Mavi", 's': 4},
        {'t': "Sari", 's': 6},
        {'t': "Beyaz", 's': 1}
      ]
    },
    {
      "questionText": "En sevdiğin hayvan ne ?",
      "answers": [
        {'t': "Köpek", 's': 5},
        {'t': "Kuş", 's': 4},
        {'t': "Kedi", 's': 4},
        {'t': "Yılan", 's': 10}
      ]
    },
    {
      "questionText": "En sevdiğin takım",
      "answers": [
        {'t': "Gs", 's': 1},
        {'t': "Fb", 's': 1},
        {'t': "Ts", 's': 1},
        {'t': "Bjk", 's': 1}
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _qIndex < _questions.length
              ? Quiz(
                  questions: _questions,
                  questionIndex: _qIndex,
                  cevapVer: _cevapVer)
              : Result(
                  score: _totalScore,
                  resartQuiz: _resartQuiz,
                ),
        ],
      ),
    );
  }
}
