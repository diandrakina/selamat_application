import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ToDo {
  final bool isDone;
  final String toDoId;
  final String iconUrl;
  final String title;
  final Timestamp startDate;
  // final time;
  // final bool isRepeat;
  final List repatDate;
  final String visibility;
  final String category;
  // Category sesuai string
  final String description;
  final bool reminder;

  const ToDo({
    required this.isDone,
    required this.toDoId,
    required this.iconUrl,
    required this.title,
    required this.startDate,
    // required this.time,
    // required this.isRepeat,
    required this.repatDate,
    required this.visibility,
    required this.category,
    required this.description,
    required this.reminder,
  });

  Map<String, dynamic> toJson() => {
        'isDone': isDone,
        'toDoId': toDoId,
        'iconUrl': iconUrl,
        'title': title,
        'startDate': startDate,
        // 'time': time,
        // 'isRepeat': isRepeat,
        'repatDate': repatDate,
        'visibility': visibility,
        'category': category,
        'description': description,
        'reminder': reminder,
      };

  static ToDo fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return ToDo(
      isDone: snapshot['isDone'],
      toDoId: snapshot['toDoId'],
      iconUrl: snapshot['iconUrl'],
      title: snapshot['title'],
      startDate: snapshot['startDate'],
      // time: snapshot['time'],
      // isRepeat: snapshot['isRepeat'],
      repatDate: snapshot['repatDate'],
      visibility: snapshot['visibility'],
      category: snapshot['category'],
      description: snapshot['description'],
      reminder: snapshot['reminder'],
    );
  }
}
