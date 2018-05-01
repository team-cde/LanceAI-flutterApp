import 'package:firebase_database/firebase_database.dart';         //new

class Job {
  String key;
  String employerId;
  String employerName = "";
  String workerId;
  Map<String, bool> candidates;
  String title;
  String description;
  String duration;
  String rate;
  String imgURL;

  Job(this.employerId, this.workerId, this.candidates, this.title,
      this.description, this.duration, this.rate, this.imgURL);

  Job.fromSnapshot(DataSnapshot snapshot) :
        key = snapshot.key,
        employerId = snapshot.value["employerId"],
        workerId = snapshot.value["workerId"],
        candidates = snapshot.value["candidates"],
        title = snapshot.value["title"],
        description = snapshot.value["description"],
        duration = snapshot.value["duration"],
        rate = snapshot.value["rate"],
        imgURL = snapshot.value["imgURL"],
        employerName = "---";

  toJson() {
    return {
      "employerId" : employerId,
      "workerId" : workerId,
      "candidates" : candidates,
      "title" : title,
      "description" : description,
      "duration" : duration,
      "rate" : rate,
      "imgURL" : imgURL,
      "employerName" : employerName;
    };
  }


}
