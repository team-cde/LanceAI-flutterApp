import 'dart:math';
import 'package:flutter/material.dart';
import '../UI/FeedbackButton.dart';

class FeedbackOverlay extends StatefulWidget {
  final bool _isCorrect;
  final VoidCallback _onTap;

  FeedbackOverlay(this._isCorrect, this._onTap);

  @override
  State createState() => new FeedbackOverlayState();
}

class FeedbackOverlayState extends State<FeedbackOverlay>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        duration: new Duration(seconds: 2), vsync: this);
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.elasticOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => widget._onTap(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: new Transform.rotate(
                angle: _iconAnimation.value * 2 * PI,
                child: new Icon(
                  widget._isCorrect == true ? Icons.done : Icons.clear,
                  size: _iconAnimation.value * 80.0,
                ),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(bottom: 20.0),
            ),
            new Text(widget._isCorrect == true ? "Accepted!" : "Rejected!",
                style: new TextStyle(color: Colors.white, fontSize: 40.0)),
            new Text("Let Lance know why...",
                style: new TextStyle(color: Colors.white, fontSize: 25.0)),
            new Padding(padding: new EdgeInsets.all(10.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new FeedbackButton(new Icon(Icons.attach_money), null),
                new FeedbackButton(new Icon(Icons.access_alarm), null),
                new FeedbackButton(new Icon(Icons.business), null),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
