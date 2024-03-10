import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:selamat_application/models/toDo.dart';
import 'package:selamat_application/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // add ToDo
  Future<String> addToDoList(
    String uid,
    Uint8List file,
    String title,
    DateTime startDate,
    time,
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
        iconUrl: photoUrl,
        title: title,
        startDate: startDate,
        time: time,
        // isRepeat: isRepeat,
        repatDate: repatDate,
        visibility: visibility,
        category: category,
        description: description,
        reminder: reminder,
      );

      _firestore.collection('users').doc(uid).collection('toDos').doc(toDoId).set(
            toDo.toJson(),
          );
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
