import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String fullName;
  final String email;
  final Timestamp dateOfBirth;
  final String profilePicUrl;
  final Timestamp startHourMinute;
  // final int startHour;
  // final int startMinute;
  final List userGoal;
  final Timestamp endHourMinute;
  // final int endHour;
  // final int endMinute;
  final List userTarget;
  final String bio; //Di profile
  final String phoneNum;

  const User({
    required this.uid,
    required this.fullName,
    required this.email,
    required this.dateOfBirth,
    // this.profilePicUrl = "",
    required this.profilePicUrl,
    required this.startHourMinute,
    // required this.startHour,
    // required this.startMinute,
    required this.userGoal,
    required this.endHourMinute,
    // required this.endHour,
    // required this.endMinute,
    required this.userTarget,
    // this.bio = "",
    required this.bio,
    required this.phoneNum,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'fullName': fullName,
        'email': email,
        'dateOfBirth': dateOfBirth,
        'profilePicUrl': profilePicUrl,
        'startHourMinute': startHourMinute,
        // 'startHour': startHour,
        // 'startMinute': startMinute,
        'userGoal': userGoal,
        'endHourMinute': endHourMinute,
        // 'endHour': endHour,
        // 'endMinute': endMinute,
        'userTarget': userTarget,
        'bio': bio,
        'phoneNum': phoneNum,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      uid: snapshot['uid'],
      fullName: snapshot['fullName'],
      email: snapshot['email'],
      dateOfBirth: snapshot['dateOfBirth'],
      profilePicUrl: snapshot['profilePicUrl'],
      startHourMinute: snapshot['startHourMinute'],
      // startHour: snapshot['startHour'],
      // startMinute: snapshot['startMinute'],
      userGoal: snapshot['userGoal'],
      endHourMinute: snapshot['endHourMinute'],
      // endHour: snapshot['endHour'],
      // endMinute: snapshot['endMinute'],
      userTarget: snapshot['userTarget'],
      bio: snapshot['bio'],
      phoneNum: snapshot['phoneNum'],
    );
  }
}
