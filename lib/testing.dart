import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selamat_application/providers/user_provider.dart';

class Testttt extends StatefulWidget {
  const Testttt({super.key});

  @override
  State<Testttt> createState() => _TesttttState();
}

class _TesttttState extends State<Testttt> {
  @override
  void initState() {
    super.initState();
    getUsername();
  }

  void getUsername() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    // print(snap.data());
    setState(() {
      username = (snap.data() as Map<String, dynamic>)['fullName'];
    });
  }

  String username = 'AAAAAA';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BERAK"),
      ),
      body: Center(
        child: Text(username, style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
