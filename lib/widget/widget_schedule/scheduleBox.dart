import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/pages/other_profile/otherProfilePage.dart';
import 'package:selamat_application/styles/styles.dart';

class ScheduleBox extends StatefulWidget {
  final String username;
  final String profilePict;
  final String desc;
  final String date;
  final double likes;
  final double comment;
  final double hours;
  final bool status;

  const ScheduleBox({
    Key? key,
    required this.username,
    required this.profilePict,
    required this.desc,
    required this.date,
    required this.likes,
    required this.comment,
    required this.hours,
    required this.status,
  });

  @override
  State<ScheduleBox> createState() => _ScheduleBoxState();
}

class _ScheduleBoxState extends State<ScheduleBox> {
  bool _isLiked = false;

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      height: 300,
      decoration: BoxDecoration(
        color: AppColors.darkModeCard,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //Kepala
        children: [
          const Padding(padding: EdgeInsets.all(5)),
          Row(
            children: [
              SizedBox(
                width: 300,
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(widget.profilePict),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const OtherProfilePage()),
                          ),
                        );
                      },
                      child: Text(
                        widget.username,
                        style: TextStyles.bold_18,
                      ),
                    ),
                  ],
                ),
              ),
              const FaIcon(
                Icons.more_vert,
                size: 20,
                color: AppColors.white,
              )
            ],
          ),
          const Padding(padding: EdgeInsets.all(8)),
          Text(
            widget.desc,
            style: TextStyles.light_18,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Padding(padding: EdgeInsets.all(5)),
          Text(
            widget.date,
            style: TextStyles.bold_18,
          ),
          const Padding(padding: EdgeInsets.all(3)),
          Column(
            children: [
              Row(
                children: [
                  _buildBox(13),
                  const SizedBox(
                    width: 5,
                  ),
                  _buildBox(14),
                  const SizedBox(
                    width: 5,
                  ),
                  _buildBox(15),
                  const SizedBox(
                    width: 5,
                  ),
                  _buildBox(16),
                  const SizedBox(
                    width: 5,
                  ),
                  _buildBox(17),
                  const SizedBox(
                    width: 5,
                  ),
                  _buildBox(18),
                  const SizedBox(
                    width: 5,
                  ),
                  _buildBox(19)
                ],
              ),
              const Padding(padding: EdgeInsets.all(3)),
              Row(
                children: [
                  _buildBox(20),
                  const SizedBox(
                    width: 5,
                  ),
                  _buildBox(21),
                  const SizedBox(
                    width: 5,
                  ),
                  _buildBox(22),
                  const SizedBox(
                    width: 5,
                  ),
                  _buildBox(23),
                ],
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.all(3)),
          Text(
            "Tap some date to see detail",
            style: TextStyles.thin_14,
          ),
          Row(
            children: [
              SizedBox(
                width: 270,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: _toggleLike,
                      icon: FaIcon(
                        _isLiked ? Icons.favorite : Icons.favorite_border,
                        color: _isLiked ? Colors.red : Colors.white,
                        size: 25,
                      ),
                    ),
                    Text(
                      "${widget.likes}k",
                      style: TextStyles.light_14,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const FaIcon(
                      FontAwesomeIcons.comment,
                      size: 20,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${widget.comment}k",
                      style: TextStyles.light_14,
                    ),
                  ],
                ),
              ),
              Text(
                "${widget.hours}h ",
                style: TextStyles.light_14,
              ),
              widget.status
                  ? const Icon(
                      Icons.public,
                      color: Colors.white,
                      size: 20,
                    )
                  : const FaIcon(
                      FontAwesomeIcons.lock,
                      color: Colors.white,
                      size: 15,
                    )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBox(int dateShare) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: AppColors.darkModeCard,
                content: Container(
                  padding: const EdgeInsets.all(5),
                  height: 250,
                  width: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const FaIcon(
                          FontAwesomeIcons.xmark,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                      Center(
                        child: Text(
                          "${dateShare} December 2023",
                          style: TextStyles.bold_16,
                        ),
                      ),
                      Center(
                        child: Text(
                          "Satoru Gojo Schedule",
                          style: TextStyles.medium_16,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildActivity(Icons.work, "Work", '07.00'),
                      const SizedBox(
                        height: 5,
                      ),
                      _buildActivity(Icons.work, "Work", '07.00'),
                      const SizedBox(
                        height: 5,
                      ),
                      _buildActivity(Icons.work, "Work", '07.00'),
                    ],
                  ),
                ),
              );
            });
      },
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: AppColors.baseColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          "${dateShare}",
          style: TextStyles.bold_18,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildActivity(IconData icon, String act, String time) {
    return Container(
      height: 40,
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.activeCalendar),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          FaIcon(
            icon,
            size: 20,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 150,
            child: Text(
              act,
              style: TextStyles.medium_14,
            ),
          ),
          Text(
            time,
            style: TextStyles.medium_14,
          )
        ],
      ),
    );
  }
}
