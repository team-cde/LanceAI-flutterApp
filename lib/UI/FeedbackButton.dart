import 'package:flutter/material.dart';

class FeedbackButton extends StatefulWidget {

  final Icon _icon;
  final VoidCallback _onTap;

  FeedbackButton(this._icon, this._onTap);

  @override
  State<StatefulWidget> createState() => new FeedbackButtonState();
}

class FeedbackButtonState extends State<FeedbackButton> {

  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
        ),
      child: new IconButton(
        disabledColor: Colors.black,
        splashColor: Colors.blue,
        iconSize: 80.0,
        icon: widget._icon,
        onPressed: widget._onTap,
      ),
    );
  }
}