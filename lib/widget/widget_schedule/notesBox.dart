import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';

class NotesBox extends StatefulWidget {
  final String username;
  final String profilePict;
  final String desc;

  final double likes;
  final double comment;
  final double hours;
  final bool status;
  const NotesBox({
    Key? key,
    required this.username,
    required this.profilePict,
    required this.desc,
    required this.likes,
    required this.comment,
    required this.hours,
    required this.status,
  });

  @override
  State<NotesBox> createState() => _NotesBoxState();
}

class _NotesBoxState extends State<NotesBox> {
  bool _isLiked = false;

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        color: AppColors.darkModeCard,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(8)),
          Text(
            widget.desc,
            style: TextStyles.light_18,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          Padding(padding: EdgeInsets.all(5)),
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
}
