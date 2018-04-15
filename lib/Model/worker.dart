import 'package:firebase_database/firebase_database.dart';         //new

class Worker {
  String key;
  String firstName;
  String lastName;
  String email;
  String github;
  Map<String, int> recommended;
  Map<String, int> activeJobs;

  Worker(this.firstName, this.lastName, this.email, this.github,
      this.recommended, this.activeJobs);

  Worker.fromSnapshot(DataSnapshot snapshot) :
        key = snapshot.key,
        firstName = snapshot.value["firstName"],
        lastName = snapshot.value["lastName"],
        email = snapshot.value["email"],
        github = snapshot.value["github"],
        recommended = snapshot.value["recommended"],
        activeJobs = snapshot.value["activeJobs"];

  toJson() {
    return {
      "firstName" : firstName,
      "lastName" : lastName,
      "email" : email,
      "github" : github,
      "recommended": recommended,
      "activeJobs": activeJobs
    };
  }
}
