import "package:flutter/material.dart";
import 'package:lancelot_v2/Model/Project.dart';
import 'package:lancelot_v2/UI/ProjectInfoWidget.dart';

class ProjectDetailPage extends StatefulWidget {

  final Project _project;

  ProjectDetailPage(this._project);

  @override
  State<StatefulWidget> createState() =>  new ProjectDetailPageState();
}

class ProjectDetailPageState extends State<ProjectDetailPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new ProjectInfo(widget._project),
            ],
          )),
    );
  }

}