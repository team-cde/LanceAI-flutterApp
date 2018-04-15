import 'package:flutter/material.dart';
import 'package:lancelot_v2/Model/Project.dart';
import 'package:lancelot_v2/UI/ProjectInfoWidget.dart';
import 'package:lancelot_v2/Pages/FeedbackOverlay.dart';
import 'package:lancelot_v2/UI/AnswerButton.dart';


class ProjectBrowsePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ProjectBrowsePageState();
  }
}

class ProjectBrowsePageState extends State<ProjectBrowsePage> {
  List<Project> _projects = Project.getDefaultProjectList();
  int _projectIndex;
  bool _answer;
  bool _isFeedbackOverlayVisible;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _projectIndex = 0;
  }

  void setAnswer(bool answer) {
    _answer = answer;

    this.setState(() {
      _isFeedbackOverlayVisible = true;
    });
  }

  void incrementProject() {
    _projectIndex++;
    if (_projectIndex == _projects.length) {
      _projectIndex = 0;
    }
  }

  Project currProject() {
    return _projects[_projectIndex];
  }

  void handleAnswer(bool answer) {}

  @override
  Widget build(BuildContext context) {
    return new Material(
        child: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new ProjectInfo(currProject()),
                new Padding(padding: new EdgeInsets.all(20.0)),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //consider replace with https://docs.flutter.io/flutter/material/RaisedButton-class.html
//                    new RaisedButton(
//                      onPressed: () => setAnswer(false),
//                      color: Colors.red,
//                    ),
//                    new RaisedButton(
//                      onPressed: () => setAnswer(true),
//                      color: Colors.green,
//                    )
                    new AnswerButton(false, () => setAnswer(false)),
                    new AnswerButton(true, () => setAnswer(true)),
                  ],
                )
              ],
            ),
            _isFeedbackOverlayVisible == true ? new FeedbackOverlay (
                _answer,
                    () {
                  this.setState(() {
                    _isFeedbackOverlayVisible = false;
                    incrementProject();
                  });
                }
            ) : new Container()

          ],
        ));
  }
}