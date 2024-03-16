import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:selamat_application/models/user.dart' as model;
import 'package:selamat_application/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signOut() async{
    await _auth.signOut();
  }

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    print("AUTH CURRENT USER ${currentUser}");
    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

//   Sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String phoneNum,
    required String fullName,
    required Timestamp dateOfBirth,
    required Timestamp startHourMinute,
    // required int startHour,
    // required int startMinute,
    required Timestamp endHourMinute,
    // required int endHour,
    // required int endMinute,
  }) async {
    String res = "Some error occurred";
    try {
      // if (email.isNotEmpty ||
      //     password.isNotEmpty ||
      //     username.isNotEmpty ||
      // bio.isNotEmpty) {
      // Register user
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // print(cred.user!.uid);


      // Uint8List file = ;

      // String photoURL = await StorageMethods()
      //     .uploadImageToStorage('ProfilePics', file, false);

      model.User user = model.User(
        uid: cred.user!.uid,
        fullName: fullName,
        email: email,
        dateOfBirth: dateOfBirth,
        profilePicUrl: "",
        startHourMinute: startHourMinute,
        // startHour: startHour,
        // startMinute: startMinute,
        userGoal: [],
        endHourMinute: endHourMinute,
        // endHour: endHour,
        // endMinute: endMinute,
        userTarget: [],
        bio: "",
        phoneNum: phoneNum,
        workDurationToday: 0,
        workDurationThisWeek: 0,
        scheduleEmoteMonthly: List<int>.filled(31, 0),
      );
      // add user to database
      await _firestore.collection('users').doc(cred.user!.uid).set(
            user.toJson(),
          );
      res = "Success!";
      // }
    }
    // on FirebaseException catch(err){
    //   if(err.code == 'invalid-email'){
    //     res = 'The email is badly formated';
    //   }
    // }

    catch (err) {
      res = err.toString();
    }
    return res;
  }

  // LOG IN
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
