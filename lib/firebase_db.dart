import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'Model/worker.dart';
import 'Model/employer.dart';
import 'Model/job.dart';

class FirebaseDB {

  static final FirebaseDB _singleton = new FirebaseDB._internal();

  static var workersReference;
  static var employersReference;
  static var jobsReference;

  static FirebaseAuth _auth = FirebaseAuth.instance;
  static GoogleSignIn _googleSignIn = new GoogleSignIn();
  static FirebaseUser user;
  static String thisUid = "12345";
  static bool signInCompleted = false;

  static const String newState = "new";
  static const String undecidedState = "undecided";
  static const String acceptedState = "accepted";
  static const String rejectedState = "rejected";

  Future<List<Job>> jobsCache = null;

  factory FirebaseDB() {
    return _singleton;
  }

  FirebaseDB._internal() {
    //signInUser();
  }

  // TODO: Perform a registration process if
  // the user is not yet in the database
  registerUser() async {
    return true;
  }

  signInUser() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    user = await _auth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    workersReference = FirebaseDatabase.instance.reference().child('workers');
    employersReference = FirebaseDatabase.instance.reference().child('employers');
    jobsReference = FirebaseDatabase.instance.reference().child('jobs');
    await registerUser();
    //thisUid = user.uid;
    signInCompleted = true;
  }

  ensureSignedIn() async {
    if (_auth.currentUser() != null) {
      await signInUser();
    }
  }

  // Get user data for the current worker
  Future<Worker> getWorkerData() async {
    await ensureSignedIn();
    var snapshot = await workersReference.child(thisUid).once();
    return new Worker.fromSnapshot(snapshot);
  }

  // Get user data for a specific employer
  Future<Employer> getEmployerData(String employerUid) async {
    await ensureSignedIn();
    var snapshot = await employersReference.child(employerUid).once();
    return new Employer.fromSnapshot(snapshot);
  }

  // Get job data for a specific job
  Future<Job> getJobData(String jobUid) async {
    await ensureSignedIn();
    var snapshot = await jobsReference.child(jobUid).once();
    return new Job.fromSnapshot(snapshot);
  }

  // Get a list of job recommendations (Job IDs) for the current worker
  // These recommendations should be jobs they have been algorithmically
  // matched to and have hor have not yet provided an evaluation for
  // Query supports list of multiple recommendation states
  // (new, undecided, accepted, rejected)

  Future<List<Job>> getAllJobs() {

    if (jobsCache == null) {
      jobsCache = getNewJobRecs([newState, undecidedState, acceptedState, rejectedState]);
    }
    return jobsCache;
  }

  Future<List<Job>> getNewJobRecs(List<String> stateList) async {
    Worker worker = await getWorkerData();
    List<Job> jobs = new List();
    Map<String, int> recs = worker.recommended;
    List<int> states = new List();
    stateList.forEach((String s) {
      switch (s) {
        case newState:
          states.add(0);
          break;
        case undecidedState:
          states.add(1);
          break;
        case acceptedState:
          states.add(2);
          break;
        case rejectedState:
          states.add(3);
      }
    });

    await Future.forEach(recs.keys, (String jobId) async {
      int recStatus = recs[jobId];
      if (states.contains(recStatus)) {
        Job job = await getJobData(jobId);
        Employer _employer = await getEmployerData(job.employerId);
        String _employerName = _employer.firstName + " " + _employer.lastName;
        job.employerName = _employerName;
        jobs.add(job);
      }
    });

    return jobs;
  }

  // Get the list of approved jobs (i.e. that the worker wants to work on)
  Future<List<Job>> getActiveJobs() async {
    Worker worker = await getWorkerData();
    List<Job> jobs = new List();
    Map<String, int> recs = worker.activeJobs;

    await Future.forEach(recs.keys, (String jobId) async {
      Job job = await getJobData(jobId);
      jobs.add(job);
    });
    return jobs;
  }

  // Undecided, accepted, rejected the decision for the recommended job
  // TODO: Add a row to the history so we can collect training data
  Future<Null> decideOnJobRec(String jobId, String decision) async {
    int decisionState = 0;
    switch (decision) {
      case newState:
        decisionState = 0;
        break;
      case undecidedState:
        decisionState = 1;
        break;
      case acceptedState:
        decisionState = 2;
        break;
      case rejectedState:
        decisionState = 3;
        break;
    }
    final TransactionResult transactionResult =
    await workersReference.child(thisUid + "/recommended/" + jobId).runTransaction((MutableData mutableData) async {
      mutableData.value = decisionState;
      return mutableData;
    });

    if (transactionResult.committed) {
      print("Succesfully decided on job rec.");
    } else {
      print('Transaction not committed.');
      if (transactionResult.error != null) {
        print(transactionResult.error.message);
      }
    }
  }
}