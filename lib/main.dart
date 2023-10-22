import 'package:flutter/material.dart';
// import 'package:musci_intrument/question.dart';
// import 'question.dart';
import 'quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKepper = [];
  void checkAnswer(bool userPickedAnwser) {
    bool correct = quizBrain.getAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
                context: context,
                title: "Game Ended",
                desc: "Play again you can have better score.")
            .show();
        quizBrain.reset();
        scoreKepper = [];
      } else {
        if (userPickedAnwser == correct) {
          scoreKepper.add(
            Icon(
              Icons.check,
              color: Colors.green,
              size: 38.0,
            ),
          );
        } else {
          scoreKepper.add(
            Icon(
              Icons.close,
              color: Colors.red,
              size: 38.0,
            ),
          );
        }
      }
      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: Text(
                "True",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () => {
                checkAnswer(true),
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: Text(
                "False",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () => {
                checkAnswer(false),
              },
            ),
          ),
        ),
        Row(
          children: scoreKepper,
        ),
      ],
    );
  }
}
