import 'package:flutter/material.dart';
import 'package:lancelot_v2/Model/Project.dart';
import 'package:lancelot_v2/UI/ProjectInfoWidget.dart';
import 'package:lancelot_v2/Pages/FeedbackOverlay.dart';
import 'package:lancelot_v2/UI/AnswerButton.dart';
import 'package:lancelot_v2/firebase_db.dart';
import 'package:lancelot_v2/Model/job.dart';

class ProjectBrowsePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ProjectBrowsePageState();
  }
}

class ProjectBrowsePageState extends State<ProjectBrowsePage> {
  List<Job> _projects = [new Job("1","1",{},"title","description","3 months","350/hr")];
  int _projectIndex;
  bool _answer;
  bool _isFeedbackOverlayVisible;
  final fb = new FirebaseDB();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _projectIndex = 0;
    updateProjectList();
  }

  void updateProjectList() async {
    _projects = await fb.getAllJobs();
    setState(() {

    });
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

  Job currProject() {
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