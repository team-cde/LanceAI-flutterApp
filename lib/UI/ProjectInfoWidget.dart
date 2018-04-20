import 'package:flutter/material.dart';
import 'package:lancelot_v2/Model/job.dart';

class ProjectInfo extends StatefulWidget {

  Job _project;

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text(widget._project.title, style: new TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
          new Text(widget._project.employerId, style: new TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
          new Text(widget._project.rate, style: new TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
          new Text(widget._project.duration, style: new TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}