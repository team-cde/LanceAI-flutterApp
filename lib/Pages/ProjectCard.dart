import 'package:flutter/material.dart';
import 'package:lancelot_v2/Model/job.dart';

class ProjectCard extends StatefulWidget {

  ProjectCard(this._job);

  final Job _job;

  @override
  State<StatefulWidget> createState() {
    return new ProjectCardState();
  }
}

class ProjectCardState extends State<ProjectCard> {


  Widget buildHeadingAndContent(String heading, String content) {
    return new Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(heading,
            style: Theme
                .of(context)
                .textTheme
                .title,
          ),
          new Padding(padding: new EdgeInsets.all(2.0)),
          new Text(content,
            style: Theme
                .of(context)
                .textTheme
                .subhead,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Expanded(
        child: new Container(
          padding: new EdgeInsets.all(12.0),
          child: new Center(
            child: new Card(
              child: new Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Text("Available Jobs",
                          style: Theme
                              .of(context)
                              .textTheme
                              .display1,
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            buildHeadingAndContent(
                                "Project", widget._job.title),
                            buildHeadingAndContent(
                                "Skills Required", "Branding, UI Design"),
                          ],
                        ),
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            buildHeadingAndContent(
                                "Client Name", widget._job.employerId),
                            buildHeadingAndContent("Rate", widget._job.rate),
                          ]
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new Flexible(
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              buildHeadingAndContent("Description", widget._job.description),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}

//  @override
//  Widget build(BuildContext context) {
//    return new Flexible(
//        child: new Container(
//            padding: new EdgeInsets.all(12.0),
//            child: new Center(
//                child: new Card(
//                    child: new Column(
//                      children: <Widget>[
//                        new Text("Available Jobs",
//                            style: Theme
//                                .of(context)
//                                .textTheme
//                                .display1
//                        ),
//                      ],
//                    )
//                )
//            )
//        )
//    );
//  }
//            new Row(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: <Widget>[
//                new Column(
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  children: <Widget>[
//                    buildHeadingAndContent("Project", "Lancelot Branding"),
//                    buildHeadingAndContent("Skills Required", "Branding, UI Design"),
//                  ],
//                ),
//              ],
//                  new Column(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    children: <Widget>[
//                      buildHeadingAndContent("Client Name", "Nick DePasquale"),
//                      buildHeadingAndContent("Rate", "50/hr"),
//                    ],
//                  ),
//                ],
//              ),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
////            new Row(
////              mainAxisAlignment: MainAxisAlignment.spaceAround,
////              children: <Widget>[
////                buildHeadingAndContent("Description", "du hello id like to speak to sombodeee today big booiiiii id like to take a beeg order of the chicken lo meain please bukbukbukbuk laoooo"),
////              ],
////            ),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//
//}