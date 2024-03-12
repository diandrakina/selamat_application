import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/pages/schedule_page/toDoList.dart';
import 'package:selamat_application/styles/styles.dart';

class ScheduleAction extends StatefulWidget {
  final String time;
  final IconData icon;
  final String activity;
  final bool repeat;

  const ScheduleAction(
      {Key? key,
      required this.activity,
      required this.icon,
      required this.time,
      required this.repeat});

  @override
  State<ScheduleAction> createState() => _ScheduleActionState();
}

class _ScheduleActionState extends State<ScheduleAction> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Slidable(
        //start
        startActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
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
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: ((context) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ToDoList(),
                  ),
                );
              }),
              icon: FontAwesomeIcons.penToSquare,
              foregroundColor: AppColors.white,
              backgroundColor: AppColors.successStreak,
            ),
            SlidableAction(
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
                      height: 250,
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
                              widget.activity,
                              style: TextStyles.bold_18,
                            ),
                          ),
                          Center(
                            child: Text(
                              widget.time,
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
                                        "Public schedule", Icons.public)),
                                SizedBox(
                                  width: 140,
                                  child: _information(
                                      "Reminder on ${widget.time}",
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
                                  child: _information(
                                      widget.repeat ? "Repeat" : "Not Repeat",
                                      FontAwesomeIcons.repeat),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          Container(
                            padding: const EdgeInsets.all(10),
                            color: AppColors.black,
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
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: AppColors.darkModeCard,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.time,
                  style: TextStyles.regular_18,
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        widget.icon,
                        size: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    widget.activity,
                    style: TextStyles.regular_18,
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        Icons.alarm,
                        size: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
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
