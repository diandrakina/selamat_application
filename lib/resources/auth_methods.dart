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

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

  late String _uid;
  late String _fullName;
  late String _password;
  late String _email;
  late DateTime _dateOfBirth;
  late DateTime _goToWorkTime;
  late List _userGoal;
  late DateTime _endWorkTime;
  late List _userTarget;

  // Sign up user
  Future<String> signUpUser(
    // required String email,
    // required String password,
    // required String username,
    // required String bio,
    // required Uint8List file,
  ) async {
    String res = "Some error occurred";
    try {
      // if (email.isNotEmpty ||
      //     password.isNotEmpty ||
      //     username.isNotEmpty ||
          // bio.isNotEmpty) {
        // Register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);

        // print(cred.user!.uid);

        // String photoURL = await StorageMethods()
        //     .uploadImageToStorage('ProfilePics', file, false);

        model.User user = model.User(
          // username: username,
          // uid: cred.user!.uid,
          // email: email,
          // bio: bio,
          // followers: [],
          // following: [],
          // photoUrl: photoURL,
          uid :_uid,
          fullName :_fullName,
          email :_email,
          dateOfBirth :_dateOfBirth,
          goToWorkTime :_goToWorkTime,
          userGoal :_userGoal,
          endWorkTime :_endWorkTime,
          userTarget :_userTarget,
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
