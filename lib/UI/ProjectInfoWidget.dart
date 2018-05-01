import 'package:flutter/material.dart';
import 'package:lancelot_v2/Model/job.dart';

class ProjectInfo extends StatefulWidget {
  Job _project;

  ProjectInfo(this._project);

  @override
  State<StatefulWidget> createState() => new ProjectInfoState();
}

class ProjectInfoState extends State<ProjectInfo> {
  bool isTapped = false;

  List<Widget> buildInfo() {
    return [
      new Text(widget._project.title,
          style: new TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
      //new Text(widget._project.employerId, style: new TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
      new Text("\$" + widget._project.rate,
          style: new TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
      new Text(widget._project.duration,
          style: new TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
      new Text(widget._project.description,
          style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold))
    ];
  }

  List<Widget> buildDescription() {
    return [
      new Text(widget._project.description,
          style: new TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
    ];
  }

  void handleTap() {
    setState(() {
      isTapped = !isTapped;
    });
  }

  static const double height = 366.0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline
        .copyWith(color: Colors.white, fontWeight: FontWeight.bold);
    final TextStyle descriptionStyle = theme.textTheme.subhead;

    return new SafeArea(
      top: false,
      bottom: false,
      child: new Container(
        padding: const EdgeInsets.all(8.0),
        height: height,
        child: new Card(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // photo and title
              new SizedBox(
                height: 184.0,
                child: new Stack(
                  children: <Widget>[
                    new Positioned.fill(
                        child: new Image.network(
                      widget._project.imgURL,
                      fit: BoxFit.cover,
                    )),
                    new Positioned(
                      bottom: 16.0,
                      left: 16.0,
                      right: 16.0,
                      child: new FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: new Container(
                          child: new Text(
                            widget._project.title,
                            style: titleStyle,
                          ),
                          decoration: new BoxDecoration (
                              color: Colors.black,
                              borderRadius: new BorderRadius.circular(3.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // description and share/explore buttons
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: new DefaultTextStyle(
                    softWrap: true,
                    overflow: TextOverflow.clip,
                    style: descriptionStyle,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // three line description
                        new Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: new Text(
                            widget._project.description,
                            style: descriptionStyle.copyWith(
                                color: Colors.black54),
                          ),
                        ),
                        new Text("\$" + widget._project.rate,
                            style: new TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            )),
                        new Text(widget._project.duration,
                            style: new TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
