import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:selamat_application/models/toDo.dart';
import 'package:selamat_application/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
