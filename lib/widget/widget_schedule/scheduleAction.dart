import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';

class ScheduleAction extends StatefulWidget {
  // final String time;
  // final IconData icon;
  // final String activity;
  // final bool repeat;
  final snap;

  const ScheduleAction({
    Key? key,
    required this.snap,
    // required this.activity,
    // required this.icon,
    // required this.time,
    // required this.repeat,
  });

  @override
  State<ScheduleAction> createState() => _ScheduleActionState();
}

class _ScheduleActionState extends State<ScheduleAction> {
  String repatDateDisplay = '';

  @override
  void initState() {
    super.initState();
    repatDateDisplay = '';
    // print(widget.snap['repatDate'][0] == 1 ? ' X' : 'Y');
    if (widget.snap['repatDate'][0] == 0 &&
        widget.snap['repatDate'][1] == 0 &&
        widget.snap['repatDate'][2] == 0 &&
        widget.snap['repatDate'][3] == 0 &&
        widget.snap['repatDate'][4] == 0 &&
        widget.snap['repatDate'][5] == 0 &&
        widget.snap['repatDate'][6] == 0) {
      repatDateDisplay = 'None';
    } else if (widget.snap['repatDate'][0] == 1 &&
        widget.snap['repatDate'][1] == 1 &&
        widget.snap['repatDate'][2] == 1 &&
        widget.snap['repatDate'][3] == 1 &&
        widget.snap['repatDate'][4] == 1 &&
        widget.snap['repatDate'][5] == 1 &&
        widget.snap['repatDate'][6] == 1) {
      repatDateDisplay = 'Everyday';
    }
    {
      if (widget.snap['repatDate'][0] == 1) {
        repatDateDisplay += 'Mon, ';
      }
      if (widget.snap['repatDate'][1] == 1) {
        repatDateDisplay += 'Tue, ';
      }
      if (widget.snap['repatDate'][2] == 1) {
        repatDateDisplay += 'Wed, ';
      }
      if (widget.snap['repatDate'][3] == 1) {
        repatDateDisplay += 'Thu, ';
      }
      if (widget.snap['repatDate'][4] == 1) {
        repatDateDisplay += 'Fri, ';
      }
      if (widget.snap['repatDate'][5] == 1) {
        repatDateDisplay += 'Sat, ';
      }
      if (widget.snap['repatDate'][6] == 1) {
        repatDateDisplay += 'Sun, ';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Timestamp firestoreTimestamp = widget.snap['startDate'];
    DateTime dateTime = firestoreTimestamp.toDate();

    int hour = dateTime.hour;
    int minute = dateTime.minute;

    return Center(
      child: Slidable(
        //start
        startActionPane: ActionPane(
          extentRatio: 0.25,
          motion: StretchMotion(),
          children: [
            SlidableAction(
              // TODOX FINISH
              onPressed: ((context) {}),
              icon: FontAwesomeIcons.circleCheck,
              backgroundColor: AppColors.pastelGreenHealth,
              foregroundColor: AppColors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12)),
            )
          ],
        ),

        //end
        endActionPane: ActionPane(
          extentRatio: 0.5,
          motion: StretchMotion(),
          children: [
            SlidableAction(
              // TODOX EDIT
              onPressed: ((context) {}),
              icon: FontAwesomeIcons.penToSquare,
              foregroundColor: AppColors.white,
              backgroundColor: AppColors.successStreak,
            ),
            SlidableAction(
              // TODOX DELETE
              onPressed: ((context) {}),
              icon: FontAwesomeIcons.trashCan,
              foregroundColor: AppColors.white,
              backgroundColor: AppColors.pastelRed,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            )
          ],
        ),

        //CONTAINER
        child: GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: AppColors.bgDarkMode,
                    content: Container(
                      padding: EdgeInsets.zero,
                      height: 300,
                      width: 380,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            child: const FaIcon(
                              FontAwesomeIcons.xmark,
                              color: Colors.white,
                              size: 20,
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          Center(
                            child: Text(
                              widget.snap['title'],
                              style: TextStyles.bold_18,
                            ),
                          ),
                          Center(
                            child: Text(
                              '${hour}:${minute}',
                              style: TextStyles.light_18,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          //Component 1
                          Center(
                            child: Row(
                              children: [
                                SizedBox(
                                    width: 124,
                                    child: _information(
                                        "${widget.snap['visibility']}",
                                        Icons.public)),
                                SizedBox(
                                  width: 140,
                                  child: _information(
                                      "Reminder on ${hour}:${minute}",
                                      FontAwesomeIcons.solidBell),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),

                          //Component 2
                          Center(
                            child: Row(
                              children: [
                                SizedBox(
                                    width: 124,
                                    child: _information(
                                        "Daily routine",
                                        // ignore: deprecated_member_use
                                        FontAwesomeIcons.solidSmile)),
                                SizedBox(
                                  width: 140,

                                  child: Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.repeat,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: 100,
                                        child: Text(
                                          repatDateDisplay,
                                          style: TextStyles.regular_12,
                                          maxLines: 3,
                                        ),
                                      )
                                    ],
                                  ),
                                  //   child: _information(
                                  //       '${widget.snap['repatDate']}',
                                  //       FontAwesomeIcons.repeat),
                                  // ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          Container(
                            child: Center(
                                child: Text(
                              '${widget.snap['description']}',
                              style: TextStyle(color: Colors.white),
                            )),
                            padding: const EdgeInsets.all(10),
                            color: Colors.grey,
                            width: double.infinity,
                            height: 100,
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          child: Container(
            height: 50,
            margin: EdgeInsets.all(5),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: AppColors.darkModeCard,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  width: 70,
                  child: Center(
                    child: Text(
                      '${hour}:${minute}',
                      style: TextStyles.regular_18,
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: NetworkImage(
                          widget.snap['iconUrl'],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  // color: Colors.green,
                  // width: 200,
                  child: Text(
                    widget.snap['title'],
                    style: TextStyles.regular_18,
                  ),
                ),
                widget.snap['reminder'] == true
                    ? Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(Icons.alarm, size: 20, color: Colors.white),
                          ],
                        ),
                      )
                    : Container(
                        height: 30,
                        width: 30,
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _information(String desc, IconData iconDesc) {
    return Row(
      children: [
        FaIcon(
          iconDesc,
          size: 15,
          color: Colors.white,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          desc,
          style: TextStyles.regular_12,
        )
      ],
    );
  }
}
