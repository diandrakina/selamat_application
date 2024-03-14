import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:selamat_application/models/user.dart';
import 'package:selamat_application/pages/activity_page/comment_screen.dart';
import 'package:selamat_application/pages/other_profile/otherProfilePage.dart';
import 'package:selamat_application/providers/user_provider.dart';
import 'package:selamat_application/resources/firestore_methods.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/utils/richie_utils.dart';
import 'package:selamat_application/widget/activity_widget/activity_date_box.dart';

class ActivityCard extends StatefulWidget {
  // final String username;
  // final String profilePict;
  // final String desc;
  // final String date;
  // final double likes;
  // final double comment;
  // final double hours;
  // final bool status;
  final snap;
  const ActivityCard(
      {super.key,
      // required this.username,
      // required this.profilePict,
      // required this.desc,
      // required this.date,
      // required this.likes,
      // required this.comment,
      // required this.hours,
      // required this.status,
      required this.snap});

  @override
  State<ActivityCard> createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
  bool _isLiked = false;

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  DateTime now = DateTime.now();

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    // if (to.difference(from).inHours / 24 == 0) {
    //   return 1;
    // }
    return (to.difference(from).inHours / 24).round();
  }

  int commentLen = 0;

  @override
  void initState() {
    super.initState();
    getComments();
  }

  void getComments() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection('activities')
          .doc(widget.snap['activityId'])
          .collection('comments')
          .get();
      commentLen = snap.docs.length;
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      // margin: EdgeInsets.symmetric(vertical: 10),
      // height: 300,
      // color: AppColors.darkModeCard,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.darkModeCard,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // AVATAR NAME BUTTON
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: widget.snap['profilePict'] != ''
                    ? NetworkImage(widget.snap['profilePict'])
                    : NetworkImage(
                        'https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg',
                      ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.snap['username'],
                        // 'Username',
                        style: TextStyles.bold_18,
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  // print(daysBetween(DateTime(widget.snap['startDate'].toDate().year, widget.snap['startDate'].toDate().month, 1,), widget.snap['startDate'].toDate()));
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: ListView(
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        shrinkWrap: true,
                        children: [
                          "Report",
                        ]
                            .map(
                              (e) => InkWell(
                                onTap: () async {
                                  // FirestoreMethods()
                                  //     .deletePost(widget.snap["postId"]);
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                  child: Text(e),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          // DESCRIPTION
          Text(
            widget.snap['desc'],
            style: TextStyles.light_18,
            // maxLines: 3,
            // overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 10,
          ),

          // // DATE MONTH
          widget.snap['isNotes'] == false
              ? Row(
                  children: [
                    Text(
                      "${DateFormat.yMMMd().format(widget.snap['startDate'].toDate())} - ${DateFormat.yMMMd().format(widget.snap['endDate'].toDate())}",
                      // "DATE MONTH - DATE MONTH",
                      style: TextStyles.bold_18,
                    ),
                  ],
                )
              : Container(),

          // // DATE BOX
          widget.snap['isNotes'] == false
              ? Container(
                  height: 100,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                    ),
                    itemCount: daysBetween(widget.snap['startDate'].toDate(),
                            widget.snap['endDate'].toDate()) +
                        1,
                    itemBuilder: (BuildContext context, int index) {
                      return ActivityDateBox(
                        dateNum: index +
                            1 +
                            daysBetween(
                                DateTime(
                                  widget.snap['startDate'].toDate().year,
                                  widget.snap['startDate'].toDate().month,
                                  1,
                                ),
                                widget.snap['startDate'].toDate()),
                        startDate: widget.snap['startDate'],
                        // endDate: widget.snap['endDate'],
                        // snap: widget.snap
                      );
                    },
                  ),
                )
              : Container(),

          // // TAP TO SEE
          Text(
            "Tap the date to see date detail",
            style: TextStyles.thin_14,
          ),

          // Like Comment
          Row(
            children: [
              IconButton(
                onPressed: () async {
                  await FirestoreMethods().likeActivity(
                    widget.snap['activityId'],
                    user.uid,
                    widget.snap['likes'],
                  );
                },
                icon: widget.snap['likes'].contains(user.uid)
                    ? const Icon(
                        size: 25,
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.favorite_border,
                        size: 25,
                      ),
              ),
              Text(
                "${widget.snap['likes'].length} Likes",
                style: TextStyles.light_14,
              ),
              const SizedBox(
                width: 15,
              ),
              IconButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CommentsScreen(snap: widget.snap),
                  ),
                ),
                icon: const FaIcon(
                  FontAwesomeIcons.comment,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              Text(
                "View all $commentLen comments",
                style: TextStyles.light_14,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Posted ${DateTime.now().difference(widget.snap['datePublished'].toDate()).inHours} h ${(DateTime.now().difference(widget.snap['datePublished'].toDate()).inMinutes) % 60} m ago ',
                style: TextStyles.light_14,
              ),
              widget.snap['status'] == "Public"
                  ? const Icon(
                      Icons.public,
                      color: Colors.white,
                      size: 20,
                    )
                  : const FaIcon(
                      FontAwesomeIcons.lock,
                      color: Colors.white,
                      size: 15,
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
