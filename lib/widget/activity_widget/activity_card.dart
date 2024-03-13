import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/pages/other_profile/otherProfilePage.dart';
import 'package:selamat_application/styles/styles.dart';

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
  const ActivityCard({
    super.key,
    // required this.username,
    // required this.profilePict,
    // required this.desc,
    // required this.date,
    // required this.likes,
    // required this.comment,
    // required this.hours,
    // required this.status,
    required this.snap
  });

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

  @override
  Widget build(BuildContext context) {
    return Container(
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
                backgroundImage: NetworkImage(
                  // widget.snap['profImage'],
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
                        // widget.snap['username'],
                        'Username',
                        style: TextStyles.bold_18,
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
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
            'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
            style: TextStyles.light_18,
            // maxLines: 3,
            // overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 10,
          ),

          // // DATE MONTH
          Row(
            children: [
              Text(
                // widget.date,
                "DATE MONTH - DATE MONTH",
                style: TextStyles.bold_18,
              ),
            ],
          ),

          // // DATE BOX
          // Container(),

          // // TAP TO SEE
          Text(
            "Tap the date to see date detail",
            style: TextStyles.thin_14,
          ),

          // Like Comment Time
          Row(
            children: [
              Container(),
              // LikeAnimation(
              //   isAnimating: widget.snap['likes'].contains(user.uid),
              //   smallLike: true,
              // child:
              IconButton(
                  onPressed: () async {
                    // await FirestoreMethods().likePost(
                    //   widget.snap['postId'],
                    //   user.uid,
                    //   widget.snap['likes'],
                    // );
                  },
                  icon: Icon(
                    size: 25,
                    Icons.favorite,
                    color: Colors.red,
                  )
                  // icon: widget.snap['likes'].contains(user.uid)
                  //     ? const Icon(
                  // size: 25,
                  //         Icons.favorite,
                  //         color: Colors.red,
                  //       )
                  //     : const Icon(Icons.favorite_border, size: 25,),
                  // ),
                  ),
              Text("200 Likes", style: TextStyles.light_14),
              const SizedBox(
                width: 15,
              ),
              const FaIcon(
                FontAwesomeIcons.comment,
                size: 20,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "100 Comments",
                style: TextStyles.light_14,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Posted h ago",
                style: TextStyles.light_14,
              ),
              // widget.status
                  // ? 
                  const Icon(
                      Icons.public, 
                      color: Colors.white,
                      size: 20,
                    )
                  // : const FaIcon(
                  //     FontAwesomeIcons.lock,
                  //     color: Colors.white,
                  //     size: 15,
                  //   ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget _buildBox(int dateShare) {
  //   return GestureDetector(
  //     onTap: () {
  //       showDialog(
  //           context: context,
  //           builder: (context) {
  //             return AlertDialog(
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(12),
  //               ),
  //               backgroundColor: AppColors.darkModeCard,
  //               content: Container(
  //                 padding: const EdgeInsets.all(5),
  //                 height: 250,
  //                 width: 400,
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     GestureDetector(
  //                       onTap: () {
  //                         Navigator.of(context).pop();
  //                       },
  //                       child: const FaIcon(
  //                         FontAwesomeIcons.xmark,
  //                         size: 15,
  //                         color: Colors.white,
  //                       ),
  //                     ),
  //                     Center(
  //                       child: Text(
  //                         "${dateShare} December 2023",
  //                         style: TextStyles.bold_16,
  //                       ),
  //                     ),
  //                     Center(
  //                       child: Text(
  //                         "Satoru Gojo Schedule",
  //                         style: TextStyles.medium_16,
  //                       ),
  //                     ),
  //                     const SizedBox(
  //                       height: 10,
  //                     ),
  //                     _buildActivity(Icons.work, "Work", '07.00'),
  //                     const SizedBox(
  //                       height: 5,
  //                     ),
  //                     _buildActivity(Icons.work, "Work", '07.00'),
  //                     const SizedBox(
  //                       height: 5,
  //                     ),
  //                     _buildActivity(Icons.work, "Work", '07.00'),
  //                   ],
  //                 ),
  //               ),
  //             );
  //           });
  //     },
  //     child: Container(
  //       height: 30,
  //       width: 30,
  //       decoration: BoxDecoration(
  //         color: AppColors.baseColor,
  //         borderRadius: BorderRadius.circular(4),
  //       ),
  //       child: Text(
  //         "${dateShare}",
  //         style: TextStyles.bold_18,
  //         textAlign: TextAlign.center,
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildActivity(IconData icon, String act, String time) {
  //   return Container(
  //     height: 40,
  //     width: double.maxFinite,
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(8),
  //         color: AppColors.activeCalendar),
  //     child: Row(
  //       children: [
  //         const SizedBox(
  //           width: 10,
  //         ),
  //         FaIcon(
  //           icon,
  //           size: 20,
  //           color: Colors.white,
  //         ),
  //         const SizedBox(
  //           width: 10,
  //         ),
  //         SizedBox(
  //           width: 150,
  //           child: Text(
  //             act,
  //             style: TextStyles.medium_14,
  //           ),
  //         ),
  //         Text(
  //           time,
  //           style: TextStyles.medium_14,
  //         )
  //       ],
  //     ),
  //   );
  // }
}
