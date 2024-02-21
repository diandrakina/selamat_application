import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String fullName;
  final String email;
  final DateTime dateOfBirth;
  final String profilePicUrl;
  final DateTime goToWorkTime;
  final List userGoal;
  final DateTime endWorkTime;
  final List userTarget;
  final String bio; //Di profile

  const User({
    required this.uid,
    required this.fullName,
    required this.email,
    required this.dateOfBirth,
    this.profilePicUrl = "",
    required this.goToWorkTime,
    required this.userGoal,
    required this.endWorkTime,
    required this.userTarget,
    this.bio = "",
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'fullName': fullName,
        'email': email,
        'dateOfBirth': dateOfBirth,
        'profilePicUrl': profilePicUrl,
        'goToWorkTime': goToWorkTime,
        'userGoal': userGoal,
        'endWorkTime': endWorkTime,
        'userTarget': userTarget,
        'bio': bio,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      uid: snapshot['uid'],
      fullName: snapshot['fullName'],
      email: snapshot['email'],
      dateOfBirth: snapshot['dateOfBirth'],
      profilePicUrl: snapshot['profilePicUrl'],
      goToWorkTime: snapshot['goToWorkTime'],
      userGoal: snapshot['userGoal'],
      endWorkTime: snapshot['endWorkTime'],
      userTarget: snapshot['userTarget'],
      bio: snapshot['bio'],
    );
  }
}
