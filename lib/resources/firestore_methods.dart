import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:selamat_application/models/activity.dart';
import 'package:selamat_application/models/toDo.dart';
import 'package:selamat_application/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // POST COMMENT
  Future<void> postComment(String activityId, String text, String uid, String name,
      String profilePic) async {
    try {
      if (text.isNotEmpty) {
        String commentId = const Uuid().v1();
        await _firestore
            .collection('activities')
            .doc(activityId)
            .collection('comments')
            .doc(commentId)
            .set({
          'profilePic': profilePic,
          'name': name,
          'uid': uid,
          'text': text,
          'commentId': commentId,
          'datePublished': DateTime.now(),
        });
      } else {
        print('Text is empty');
      }
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  // LIKE ACTIVITY
  Future<void> likeActivity(String activityId, String uid, List likes) async {
    try {
      if (likes.contains(uid)) {
        await _firestore.collection('activities').doc(activityId).update(
          {
            'likes': FieldValue.arrayRemove([uid]),
          },
        );
      } else {
        await _firestore.collection('activities').doc(activityId).update(
          {
            'likes': FieldValue.arrayUnion([uid]),
          },
        );
      }
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  // Add Activity
  Future<String> addActivity(
    final bool isNotes,
    final String uid,
    final String profilePict,
    final String username,
    final String desc,
    final DateTime startDate,
    final DateTime endDate,
    final String status,
  ) async {
    String res = 'Some error occurred';
    try {
      String activityId = Uuid().v1();

      Activity activity = Activity(
        isNotes: isNotes,
        uid: uid,
        activityId: activityId,
        profilePict: profilePict,
        username: username,
        desc: desc,
        startDate: Timestamp.fromDate(startDate),
        endDate: Timestamp.fromDate(endDate),
        likes: [],
        datePublished: DateTime.now(),
        status: status,
      );

      _firestore.collection('activities').doc(activityId).set(
            activity.toJson(),
          );
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Return number of task that is donec
  Future<int> numOfTaskDone(
    String uid,
  ) async {
    int doneTaskNum = 0;
    try {
      DateTime morning = DateTime.now();
      DateTime night = DateTime.now();
      morning =
          DateTime(morning.year, morning.month, morning.day, 0, 1, 0, 0, 0);
      night =
          DateTime(night.year, night.month, night.day, 23, 59, 59, 999, 999);
      QuerySnapshot doneTask = await _firestore
          .collection('users')
          .doc(uid)
          .collection('toDos')
          .where('startDate', isGreaterThanOrEqualTo: morning)
          .where('startDate', isLessThanOrEqualTo: night)
          .where('isDone', isEqualTo: true)
          .get();
      doneTaskNum = doneTask.size;
    } catch (e) {
      print(e.toString());
    }
    print('DONEEEEEEEEE NUMMMMMMM${doneTaskNum}');
    return doneTaskNum;
  }

  // Number of task today
  Future<int> numOfTaskToday(
    String uid,
  ) async {
    int taskNum = 0;
    try {
      DateTime morning = DateTime.now();
      DateTime night = DateTime.now();
      morning =
          DateTime(morning.year, morning.month, morning.day, 0, 1, 0, 0, 0);
      night =
          DateTime(night.year, night.month, night.day, 23, 59, 59, 999, 999);
      QuerySnapshot doneTask = await _firestore
          .collection('users')
          .doc(uid)
          .collection('toDos')
          .where('startDate', isGreaterThanOrEqualTo: morning)
          .where('startDate', isLessThanOrEqualTo: night)
          .get();
      taskNum = doneTask.size;
    } catch (e) {
      print(e.toString());
    }
    print('DONEEEEEEEEE NUMMMMMMM${taskNum}');
    return taskNum;
  }

  // UPDATE DONE Di TODOLIST
  Future<String> updateDoneToDoList(
    String toDoId,
    String uid,
    String photoUrl,
    bool isDone,
    String title,
    DateTime startDate,
    List repatDate,
    String visibility,
    String category,
    String description,
    bool reminder,
  ) async {
    String res = 'Some error occurred';
    try {
      ToDo toDo = ToDo(
        isDone: isDone,
        toDoId: toDoId,
        iconUrl: photoUrl,
        title: title,
        startDate: Timestamp.fromDate(startDate),
        repatDate: repatDate,
        visibility: visibility,
        category: category,
        description: description,
        reminder: reminder,
      );

      _firestore
          .collection('users')
          .doc(uid)
          .collection('toDos')
          .doc(toDoId)
          .update(
            toDo.toJson(),
          );
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Update TODOLIST
  Future<String> updateToDoList(
    String toDoId,
    String uid,
    String photoUrl,
    bool isDone,
    String title,
    DateTime startDate,
    List repatDate,
    String visibility,
    String category,
    String description,
    bool reminder,
  ) async {
    String res = 'Some error occurred';
    try {
      ToDo toDo = ToDo(
        isDone: isDone,
        toDoId: toDoId,
        iconUrl: photoUrl,
        title: title,
        startDate: Timestamp.fromDate(startDate),
        repatDate: repatDate,
        visibility: visibility,
        category: category,
        description: description,
        reminder: reminder,
      );

      _firestore
          .collection('users')
          .doc(uid)
          .collection('toDos')
          .doc(toDoId)
          .update(
            toDo.toJson(),
          );
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // add ToDo
  Future<String> addToDoList(
    String uid,
    Uint8List file,
    String title,
    DateTime startDate,
    // time,
    // bool isRepeat,
    List repatDate,
    String visibility,
    String category,
    String description,
    bool reminder,
  ) async {
    String res = 'Some error occurred';
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('toDoIcons', file, true);

      String toDoId = Uuid().v1();

      ToDo toDo = ToDo(
        isDone: false,
        toDoId: toDoId,
        iconUrl: photoUrl,
        title: title,
        startDate: Timestamp.fromDate(startDate),
        // time: time,
        // isRepeat: isRepeat,
        repatDate: repatDate,
        visibility: visibility,
        category: category,
        description: description,
        reminder: reminder,
      );

      _firestore
          .collection('users')
          .doc(uid)
          .collection('toDos')
          .doc(toDoId)
          .set(
            toDo.toJson(),
          );
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Delete Task
  Future<void> deleteToDo(String uid, String toDoId) async {
    try {
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('toDos')
          .doc(toDoId)
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
