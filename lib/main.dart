import 'package:flutter/material.dart';
import 'Pages/HomePage.dart';
import 'firebase_db.dart';
import 'Model/worker.dart';
import 'Model/employer.dart';
import 'Model/job.dart';
import 'Pages/BottomNavigationDemo.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final fb = new FirebaseDB();

  @override
  Widget build(BuildContext context) {

    // This is just a test for the db
    //testDb();

    ThemeData theme = new ThemeData(
      primaryColor: new Color.fromARGB(255, 105, 26, 178),
      accentColor: new Color.fromARGB(255, 20, 207, 181),
    );


    return new MaterialApp(
      title: 'Lancelot',
      theme: theme,
      //home: new ProjectBrowsePage(),
      home: new HomePage(),
    );
  }

  void testDb() async {
    print("Testing DB");
    //await fb.signInUser();

    Worker worker = await fb.getWorkerData();
    print("Done getting worker data");
    print(worker.toJson());

    Employer employer = await fb.getEmployerData("12345");
    print("Done getting employer data");
    print(employer.toJson());

    Job job = await fb.getJobData("12345");
    print("Done getting job data");
    print(job.toJson());

    List<Job> recJobs = await fb.getNewJobRecs([FirebaseDB.newState, FirebaseDB.undecidedState, FirebaseDB.acceptedState, FirebaseDB.rejectedState]);
    print("Done getting recommended jobs");
    recJobs.forEach((job) => print(job.toJson()));

    await fb.decideOnJobRec("12345", "undecided");
    print("Done deciding on job rec");
    // FutureBuilder <-- Derek
  }
}

