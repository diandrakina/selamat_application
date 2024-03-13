import 'package:cloud_firestore/cloud_firestore.dart';

class Activity {
  final bool isNotes;
  final String uid;
  final String activityId;
  final String profilePict;
  final String username;
  final String desc;
  final Timestamp startDate;
  final Timestamp endDate;
  final likes;
  final datePublished;
  final String status;

  const Activity({
    required this.isNotes,
    required this.uid,
    required this.activityId,
    required this.profilePict,
    required this.username,
    required this.desc,
    required this.startDate,
    required this.endDate,
    required this.likes,
    required this.datePublished,
    required this.status,
  });

  Map<String, dynamic> toJson() => {
        'isNotes': isNotes,
        'uid': uid,
        'activityId': activityId,
        'profilePict': profilePict,
        'username': username,
        'desc': desc,
        'startDate': startDate,
        'endDate': endDate,
        'likes': likes,
        'datePublished': datePublished,
        'status': status,
      };

  static Activity fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Activity(
        isNotes: snapshot['isNotes'],
        uid: snapshot['uid'],
        activityId: snapshot['activityId'],
        profilePict: snapshot['profilePict'],
        username: snapshot['username'],
        desc: snapshot['desc'],
        startDate: snapshot['startDate'],
        endDate: snapshot['endDate'],
        likes: snapshot['likes'],
        datePublished: snapshot['datePublished'],
        status: snapshot['status'],
    );
  }
}
