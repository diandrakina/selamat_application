import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      padding: EdgeInsets.only(left: 15, right: 15),
      height: 300,
      decoration: BoxDecoration(
        color: AppColors.darkModeCard,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //Kepala
        children: [
          Padding(padding: EdgeInsets.all(5)),
          Row(
            children: [
              Container(
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
                    Padding(padding: EdgeInsets.all(5)),
                    Text(
                      widget.username,
                      style: TextStyles.medium_18,
                    ),
                  ],
                ),
              ),
              FaIcon(
                Icons.more_vert,
                size: 20,
                color: AppColors.white,
              )
            ],
          ),
          Padding(padding: EdgeInsets.all(8)),
          Text(
            widget.desc,
            style: TextStyles.light_18,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Padding(padding: EdgeInsets.all(5)),
          Text(
            widget.date,
            style: TextStyles.bold_18,
          ),
          Padding(padding: EdgeInsets.all(3)),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    _buildBox(13),
                    SizedBox(
                      width: 5,
                    ),
                    _buildBox(14),
                    SizedBox(
                      width: 5,
                    ),
                    _buildBox(15),
                    SizedBox(
                      width: 5,
                    ),
                    _buildBox(16),
                    SizedBox(
                      width: 5,
                    ),
                    _buildBox(17),
                    SizedBox(
                      width: 5,
                    ),
                    _buildBox(18),
                    SizedBox(
                      width: 5,
                    ),
                    _buildBox(19)
                  ],
                ),
                Padding(padding: EdgeInsets.all(3)),
                Row(
                  children: [
                    _buildBox(20),
                    SizedBox(
                      width: 5,
                    ),
                    _buildBox(21),
                    SizedBox(
                      width: 5,
                    ),
                    _buildBox(22),
                    SizedBox(
                      width: 5,
                    ),
                    _buildBox(23),
                  ],
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(3)),
          Text(
            "Tap some date to see detail",
            style: TextStyles.thin_14,
          ),
          Row(
            children: [
              Container(
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
                    SizedBox(
                      width: 15,
                    ),
                    FaIcon(
                      FontAwesomeIcons.comment,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
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
                  ? Icon(
                      Icons.public,
                      color: Colors.white,
                      size: 20,
                    )
                  : FaIcon(
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
    return Container(
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
    );
  }
}
