import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget {
  final String _question;
  final int _questionNumber;

  QuestionText(this._question, this._questionNumber);

  @override
  State createState() => new QuestionTextState();
}

class QuestionTextState extends State<QuestionText> with SingleTickerProviderStateMixin {
  Animation<double> _fontSizeAnimation; /* This is the animation's value {0.0, 0.1,...,1.0} */
  AnimationController _fontSizeAnimationController;

  @override
  void initState() { /* Assign the objects to the above variables */
    super.initState();
    _fontSizeAnimationController = new AnimationController(duration: new Duration(milliseconds: 700), vsync: this);
    _fontSizeAnimation = new CurvedAnimation(parent: _fontSizeAnimationController, curve: Curves.bounceOut);
    _fontSizeAnimation.addListener(() => this.setState(() {})); /* Eveytime the value of the animation changes, rerender that text */
    Future.delayed(Duration(milliseconds: 500), () {_fontSizeAnimationController.forward();});
  }

  @override
  void dispose() {
    _fontSizeAnimationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(QuestionText oldWidget) {  /* Called when widget is updated */
    super.didUpdateWidget(oldWidget);
    if (oldWidget._question != widget._question) {
      _fontSizeAnimationController.reset();
      _fontSizeAnimationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white,
      child: new Padding(
          padding: new EdgeInsets.symmetric(vertical: 20.0),
          child: new Center(child: new Text("Question " + widget._questionNumber.toString() + ": " + widget._question.toString(), style: new TextStyle(fontSize: _fontSizeAnimation.value * 15)))
      ),
    );
  }
}
