import 'package:firebase_database/firebase_database.dart';         //new

class Employer {
  String key;
  String firstName;
  String lastName;
  String email;
  String company;

  Employer(this.firstName, this.lastName, this.email, this.company);

  Employer.fromSnapshot(DataSnapshot snapshot) :
        key = snapshot.key,
        firstName = snapshot.value["firstName"],
        lastName = snapshot.value["lastName"],
        email = snapshot.value["email"],
        company = snapshot.value["company"];

  toJson() {
    return {
      "firstName" : firstName,
      "lastName" : lastName,
      "email" : email,
      "company" : company
    };
  }
}
