import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';

class ProfilePsikolog extends StatefulWidget {
  final String imagePsikolog;
  final String namePsikolog;
  const ProfilePsikolog(
      {Key? key, required this.imagePsikolog, required this.namePsikolog});

  @override
  State<ProfilePsikolog> createState() => _ProfilePsikologState();
}

class _ProfilePsikologState extends State<ProfilePsikolog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 70,
      child: Column(children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage(widget.imagePsikolog), fit: BoxFit.cover),
          ),
        ),
        Padding(padding: EdgeInsets.all(2)),
        Text(
          widget.namePsikolog,
          style: TextStyles.light_14,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ]),
    );
  }
}
