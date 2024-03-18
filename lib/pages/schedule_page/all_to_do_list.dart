import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selamat_application/models/toDo.dart';
import 'package:selamat_application/models/user.dart';
import 'package:selamat_application/providers/user_provider.dart';
import 'package:selamat_application/widget/widget_schedule/scheduleAction.dart';

class AllToDoList extends StatefulWidget {
  const AllToDoList({super.key});

  @override
  State<AllToDoList> createState() => _AllToDoListState();
}

class _AllToDoListState extends State<AllToDoList> {
  DateTime morning = DateTime.now();
  DateTime night = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    morning = DateTime(morning.year, morning.month, morning.day, 0, 1, 0, 0, 0);
    night = DateTime(night.year, night.month, night.day, 23, 59, 59, 999, 999);
    print(morning);
    print(night);
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;

    return Container(
      // color: Colors.green,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      margin: EdgeInsets.only(top: 65),
      child: Scaffold(
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .collection('toDos')
              // .orderBy('startDate', descending: true)
              .where('startDate', isGreaterThanOrEqualTo: morning)
              .where('startDate', isLessThanOrEqualTo: night)
              .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) => ScheduleAction(
                snap: snapshot.data!.docs[index].data(),
              ),
            );
          },
        ),
      ),
    );
  }
}
