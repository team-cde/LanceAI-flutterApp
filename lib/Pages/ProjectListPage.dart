import 'package:flutter/foundation.dart';
import 'package:lancelot_v2/Model/Project.dart';

import 'package:lancelot_v2/firebase_db.dart';
import 'package:flutter/material.dart';
import 'package:lancelot_v2/Model/job.dart';
import 'package:lancelot_v2/Pages/ProjectDetailPage.dart';

class ProjectListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ProjectListPageState();
  }
}

class ProjectListPageState extends State<ProjectListPage> {
  final FirebaseDB db = new FirebaseDB();

  Widget getJobsFromTheFuture() {
    return new FutureBuilder<List<Job>>(
      future: db.getAllJobs(), // a Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<List<Job>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none: return new Text('Press button to start');
          case ConnectionState.waiting: return new Text('Awaiting result...');
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              return new ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return new ListTile(
                      title: new Text(snapshot.data[index].title),
                      onTap: () {
                        Navigator.push(context, new MaterialPageRoute(builder: (context) => new ProjectDetailPage(snapshot.data[index])));
                      },
                    );
                  });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return getJobsFromTheFuture();
  }
}
