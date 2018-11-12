import 'package:flutter/material.dart';

import '../utils/questions.dart';
import '../utils/quiz.dart';
import '../UI/answer_button.dart';
import '../UI/question_text.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState(); /* Connecting the quizpage with the stateQuizPAge. */
}

class QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Column( /* This is the main page. */
          children: <Widget>[
            new AnswerButton(true, () => print("You answered TRUE")),
            new QuestionText("Pizza is nice", 1),
            new AnswerButton(false, () => print("You answered FALSE"))
          ],
        ),
      ]
    );
  }
}