import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selamat_application/models/toDo.dart';
import 'package:selamat_application/models/user.dart';
import 'package:selamat_application/providers/user_provider.dart';
import 'package:selamat_application/widget/widget_schedule/scheduleAction.dart';

class AfternoonList extends StatefulWidget {
  const AfternoonList({super.key});

  @override
  State<AfternoonList> createState() => _AfternoonListState();
}

class _AfternoonListState extends State<AfternoonList> {
  DateTime afternoon = DateTime.now();
  DateTime evening = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    afternoon = DateTime(afternoon.year, afternoon.month, afternoon.day, 12, 0, 0, 0, 0);
    evening = DateTime(evening.year, evening.month, evening.day, 17, 59, 59, 999, 999);
    print(afternoon);
    print(evening);
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
              .where('startDate', isGreaterThanOrEqualTo: afternoon)
              .where('startDate', isLessThanOrEqualTo: evening)
              .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              // Balikin banyaknya docs ID
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
