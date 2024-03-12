import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selamat_application/models/toDo.dart';
import 'package:selamat_application/models/user.dart';
import 'package:selamat_application/providers/user_provider.dart';
import 'package:selamat_application/widget/widget_schedule/scheduleAction.dart';

class EveningList extends StatefulWidget {
  const EveningList({super.key});

  @override
  State<EveningList> createState() => _EveningListState();
}

class _EveningListState extends State<EveningList> {
  DateTime evening = DateTime.now();
  DateTime night = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    evening = DateTime(evening.year, evening.month, evening.day, 18, 0, 0, 0, 0);
    night = DateTime(night.year, night.month, night.day, 23, 59, 59, 999, 999);
    print(evening);
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
              .where('startDate', isGreaterThanOrEqualTo: evening)
              .where('startDate', isLessThanOrEqualTo: night)
              .orderBy('startDate', descending: true)
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
