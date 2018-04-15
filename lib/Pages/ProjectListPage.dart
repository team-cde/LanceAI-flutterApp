import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lancelot_v2/Model/Project.dart';
import 'package:lancelot_v2/Pages/ProjectDetailPage.dart';

class ProjectListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ProjectListPageState();
  }
}

class ProjectListPageState extends State<ProjectListPage> {
  final List<Project> items = Project.getDefaultProjectList();

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return new ListTile(
            title: new Text('${items[index].name}'),
            onTap: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new ProjectDetailPage(items[index])));
            },
          );
        });
  }
}
