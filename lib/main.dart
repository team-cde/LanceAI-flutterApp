import 'package:flutter/material.dart';
import 'package:lancelot_v2/Model/Project.dart';
import 'package:lancelot_v2/UI/ProjectInfoWidget.dart';
import 'package:lancelot_v2/Pages/FeedbackOverlay.dart';
import 'package:lancelot_v2/UI/AnswerButton.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Lancelot',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new ProjectBrowsePage(),
    );
  }
}

class ProjectBrowsePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ProjectBrowsePageState();
  }
}

class ProjectBrowsePageState extends State<ProjectBrowsePage> {
  List<Project> _projects = ([
    new Project("Star Finder App", "NASA", "160/hr", "6 months"),
    new Project("Fintech Website", "Chase", "180/hr", "4 months"),
    new Project("Mobile Game", "Runescape", "140/hr", "12 months"),
  ]);
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
