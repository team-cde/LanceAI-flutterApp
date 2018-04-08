import 'package:flutter/material.dart';
import 'package:lancelot_v2/Project.dart';


class ProjectInfo extends StatefulWidget {

  Project _project;

  ProjectInfo(this._project);

  @override
  State<StatefulWidget> createState() => new ProjectInfoState();
}

class ProjectInfoState extends State<ProjectInfo> {

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(widget._project.name, style: new TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
          new Text(widget._project.company, style: new TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
          new Text(widget._project.price, style: new TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
          new Text(widget._project.duration, style: new TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}