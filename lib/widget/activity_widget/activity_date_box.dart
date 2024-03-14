import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selamat_application/models/user.dart';
import 'package:selamat_application/providers/user_provider.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/activity_widget/listtile_activity.dart';

class ActivityDateBox extends StatefulWidget {
  final int dateNum;
  final Timestamp startDate;
  // final Timestamp endDate;
  // final snap;
  const ActivityDateBox({
    super.key,
    required this.dateNum,
    required this.startDate,
    // required this.endDate,
    // required this.snap,
  });

  @override
  State<ActivityDateBox> createState() => _ActivityDateBoxState();
}

class _ActivityDateBoxState extends State<ActivityDateBox> {

  @override
  Widget build(BuildContext context) {
  DateTime _startDate = widget.startDate.toDate();
  DateTime startOfTheDay = DateTime(_startDate.year, _startDate.month, _startDate.day, 0, 1, 0, 0, 0);
  DateTime endOfTheDay = DateTime(_startDate.year, _startDate.month, _startDate.day, 23, 59, 59, 999, 999);
    final User user = Provider.of<UserProvider>(context).getUser;

    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.blue,
      ),
      width: 50,
      height: 50,
      child: GestureDetector(
        onTap: () {
          // SHOW DATE ACTIVITY
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: AppColors.darkModeCard,
                title: Text(
                  'Activity on ${widget.dateNum}',
                  style: TextStyles.bold_24,
                ),
                content: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 180,
                    width: 380,
                    child: Scaffold(
                      body: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('users')
                            .doc(user.uid)
                            .collection('toDos')
                            .where('startDate', isGreaterThanOrEqualTo: startOfTheDay)
                            // .where('startDate', isLessThanOrEqualTo: endOfTheDay)
                            // .orderBy('startDate', descending: true)
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) => ListTileActivity(
                              snap: snapshot.data!.docs[index].data(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ],
              );
            },
          );
        },
        child: Center(
          child: Text(
            '${widget.dateNum}',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
