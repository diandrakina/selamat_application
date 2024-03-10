import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:selamat_application/models/toDo.dart';

class AllToDoList extends StatefulWidget {
  const AllToDoList({super.key});

  @override
  State<AllToDoList> createState() => _AllToDoListState();
}

class _AllToDoListState extends State<AllToDoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('toDo').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Placeholder();
          // return ListView.builder(
            // Balikin banyaknya docs ID
            // itemCount: snapshot.data!.docs.length,
          //   itemBuilder: (context, index) => 
          //   // ToDo(
          //   //   snap: snapshot.data!.docs[index].data();
          //   // ),
          // );
        },
      ),
    );
  }
}