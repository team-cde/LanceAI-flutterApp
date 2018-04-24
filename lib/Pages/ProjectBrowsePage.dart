import 'package:flutter/material.dart';
import 'package:lancelot_v2/Model/Project.dart';
import 'package:lancelot_v2/UI/ProjectInfoWidget.dart';
import 'package:lancelot_v2/Pages/FeedbackOverlay.dart';
import 'package:lancelot_v2/UI/AnswerButton.dart';
import 'package:lancelot_v2/firebase_db.dart';
import 'package:lancelot_v2/Model/job.dart';
import 'package:flutter/cupertino.dart';

class ProjectBrowsePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ProjectBrowsePageState();
  }
}

class ProjectBrowsePageState extends State<ProjectBrowsePage> {
  List<Job> _projects = [new Job("Loading...","",{},"","","","",""   )];
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
    print("heeeeeey");
  }

  void updateProjectList() async {
    _projects = await fb.getAllJobs();
    if (this.mounted) {
      setState(() {});
    }
  }

  void setAnswer(bool answer) {
    _answer = answer;
    if (this.mounted) {
      this.setState(() {
        _isFeedbackOverlayVisible = true;
      });
    }
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

  Widget buildCard() {
    return new Card(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: const Icon(Icons.album),
            title: const Text('The Enchanted Nightingale'),
            subtitle: const Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
          ),
          new ButtonTheme.bar( // make buttons use the appropriate styles for cards
            child: new ButtonBar(
              children: <Widget>[
                new FlatButton(
                  child: const Text('BUY TICKETS'),
                  onPressed: () { /* ... */ },
                ),
                new FlatButton(
                  child: const Text('LISTEN'),
                  onPressed: () { /* ... */ },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
        child: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
//            new Column(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: <Widget>[
//                new ProjectInfo(currProject()),
//                //buildCard(),
//              ],
//            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new ProjectInfo(currProject()),
                //new Padding(padding: new EdgeInsets.all(20.0)),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
//                    new AnswerButton(false, () => setAnswer(false)),
//                    new AnswerButton(true, () => setAnswer(true)),
                    new Container(
                      padding: new EdgeInsets.all(45.0),
                      color: Colors.red,
                      child: new IconButton(
                        icon: new Icon(Icons.thumb_down),
                        onPressed: () => setAnswer(false),
                        splashColor: Colors.red,
                        disabledColor: Colors.grey,
                        iconSize: 95.0,
                      ),
                    ),
                    new Container(
                      padding: new EdgeInsets.all(45.0),
                      color: Colors.green,
                      child: new IconButton(
                        icon: new Icon(Icons.thumb_up),
                        onPressed: () => setAnswer(true),
                        splashColor: Colors.green,
                        disabledColor: Colors.grey,
                        iconSize: 95.0,
                      ),
                    ),


                  ],
                )
              ],
            ),
            _isFeedbackOverlayVisible == true ? new FeedbackOverlay (
                _answer, () {
                  // Exception if the widget calls setState() after dispose()
                  if (this.mounted) {
                    this.setState(() {
                      _isFeedbackOverlayVisible = false;
                      incrementProject();
                    });
                  }
                }
            ) : new Container()

          ],
        ));
  }
}