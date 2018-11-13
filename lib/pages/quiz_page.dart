import 'package:flutter/material.dart';

import '../utils/questions.dart';
import '../utils/quiz.dart';
import '../UI/answer_button.dart';
import '../UI/question_text.dart';
import '../UI/correct_wrong_overlay.dart';
import './score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState(); /* Connecting the quizpage with the stateQuizPAge. */
}

class QuizPageState extends State<QuizPage> {

  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Bananas emit anti-protons", true),
    new Question("Vennon is a villain", false),
    new Question("Elon Musk is the co-founder of PayPal", true),
    new Question("Isac Asimov was a Computer Scientist", false),
    new Question("Python is a procedural language", false)
  ]);
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayOn = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnsewer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() { /* We have to call this because we want to display the overlay, which means we are changing something about the visuals, wich will result in re-building the widgets (and showing new visuals) */
      overlayOn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column( /* This is the main page. */
          children: <Widget>[
            new AnswerButton(true, () => handleAnsewer(true)),
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () => handleAnsewer(false))
          ],
        ),
        overlayOn == true ? new CorrectWrongOverlay(
          isCorrect,
          () {
            if (quiz.length == questionNumber) {
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length)), (Route route) => false);
              return;
            }
            currentQuestion = quiz.nextQuestion;
            this.setState(() {
              overlayOn = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
            });
          }
        ) : new Container()
      ]
    );
  }
}