import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/searchBar.dart';

class SearchDiscoverPage extends StatefulWidget {
  const SearchDiscoverPage({super.key});

  @override
  State<SearchDiscoverPage> createState() => _SearchDiscoverPageState();
}

class _SearchDiscoverPageState extends State<SearchDiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leadingWidth: double.maxFinite,
        leading: Container(
          color: AppColors.bgDarkMode,
          child: Row(
            children: [
              Padding(padding: EdgeInsets.all(5)),
              FaIcon(
                Icons.arrow_back,
                color: AppColors.white,
                size: 25,
              ),
              Padding(padding: EdgeInsets.all(5)),
              Text(
                "Search",
                style: TextStyles.bold_30,
              ),
            ],
          ),
        ),
      ),

      //BODY
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(8)),
            CustomSearchBar(),
            Padding(padding: EdgeInsets.all(8)),
            Text(
              "Recent",
              style: TextStyles.medium_24,
            ),
            SizedBox(
              height: 20,
            ),
            Psikolog(
                profilePicture:
                    'assets/images/discovery_page/psikolog/MarkLee.jpg',
                name: "Mark Lee",
                code: "26090989",
                rating: 4.9),
            Padding(padding: EdgeInsets.all(8)),
            Psikolog(
                profilePicture:
                    'assets/images/discovery_page/psikolog/ChenZheyuan.jpg',
                name: "Chen Zheyuan",
                code: "29872341",
                rating: 4.7),
            Padding(padding: EdgeInsets.all(8)),
            Psikolog(
                profilePicture:
                    'assets/images/discovery_page/psikolog/SongEunseok.jpg',
                name: "Song Eunseok",
                code: "23132949",
                rating: 5.0),
            Padding(padding: EdgeInsets.all(8)),
            Psikolog(
                profilePicture:
                    'assets/images/discovery_page/psikolog/Joel.jpeg',
                name: "Joeliardo Leviothniel",
                code: "298745362",
                rating: 4.6),
          ],
        ),
      ),
    ));
  }
}

class Psikolog extends StatefulWidget {
  final String profilePicture;
  final String name;
  final String code;
  final double rating;
  const Psikolog(
      {Key? key,
      required this.profilePicture,
      required this.name,
      required this.code,
      required this.rating});

  @override
  State<Psikolog> createState() => _PsikologState();
}

class _PsikologState extends State<Psikolog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(widget.profilePicture),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(8)),
          SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyles.bold_16,
                ),
                Text(
                  "Code : ${widget.code}",
                  style: TextStyles.light_14,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
          ),
          Text(
            "${widget.rating}",
            style: TextStyles.light_16,
          ),
          Padding(padding: EdgeInsets.all(3)),
          FaIcon(
            Icons.star,
            color: Colors.yellow,
            size: 20,
          )
        ],
      ),
    );
  }
}
