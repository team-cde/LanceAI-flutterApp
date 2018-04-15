import 'package:firebase_database/firebase_database.dart';         //new

class Job {
  String key;
  String employerId;
  String workerId;
  Map<String, bool> candidates;
  String title;
  String description;

  Job(this.employerId, this.workerId, this.candidates, this.title, this.description);

  Job.fromSnapshot(DataSnapshot snapshot) :
        key = snapshot.key,
        employerId = snapshot.value["employerId"],
        workerId = snapshot.value["workerId"],
        candidates = snapshot.value["candidates"],
        title = snapshot.value["title"],
        description = snapshot.value["description"];

  toJson() {
    return {
      "employerId" : employerId,
      "workerId" : workerId,
      "candidates" : candidates,
      "title" : title,
      "description" : description
    };
  }
}
