import 'package:flutter/material.dart';

import './quiz_page.dart';

class LandingPage extends StatelessWidget {
  /* The annotation @override marks an instance member as overriding a superclass member with the same name. It just points out that the function is also defined in an ancestor class, but is being redefined to do something else in the current class.*/
  @override
  /* Describes the part of the user interface represented by this widget. */
  /* BuildContext objects are passed to WidgetBuilder functions. Each widget 
  has its own BuildContext, which becomes the parent of the widget returned 
  by the StatelessWidget.build function. In particular, this means that within 
  a build method, the build context of the widget of the build method is not 
  the same as the build context of the widgets returned by that build method. 
  "In particular, this means that within a build method, the build context 
  of the widget of the build method is not the same as the build context of 
  the widgets returned by that build method. "*/
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.greenAccent,
      child: new InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new QuizPage())),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Lets quizzz", style: new TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold)),
            new Text("Tap to start!", style: new TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
          ]
        )
      ),
    );
  }
}