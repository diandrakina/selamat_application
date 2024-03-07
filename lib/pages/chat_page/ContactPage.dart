import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/pages/chat_page/ChatPage.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/searchBar.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<String> photo = [
    'assets/images/home_page/gojosatoru.png',
    'assets/images/discovery_page/psikolog/ChenZheyuan.jpg',
    'assets/images/home_page/donaldtrump.png',
    'assets/images/discovery_page/psikolog/SongEunseok.jpg',
    'assets/images/home_page/gojosatoru.png',
    'assets/images/discovery_page/psikolog/ChenZheyuan.jpg',
    'assets/images/home_page/donaldtrump.png',
    'assets/images/discovery_page/psikolog/SongEunseok.jpg',
    'assets/images/home_page/gojosatoru.png',
    'assets/images/discovery_page/psikolog/ChenZheyuan.jpg',
    'assets/images/home_page/donaldtrump.png',
    'assets/images/discovery_page/psikolog/SongEunseok.jpg',
    'assets/images/home_page/gojosatoru.png',
    'assets/images/discovery_page/psikolog/ChenZheyuan.jpg',
    'assets/images/home_page/donaldtrump.png',
    'assets/images/discovery_page/psikolog/SongEunseok.jpg',
    'assets/images/home_page/gojosatoru.png',
    'assets/images/discovery_page/psikolog/ChenZheyuan.jpg',
    'assets/images/home_page/donaldtrump.png',
    'assets/images/discovery_page/psikolog/SongEunseok.jpg',
  ];
  List<String> name = [
    'Gojo Satoru',
    'Chen Zheyuan',
    'Donald Trump',
    'Song Eunseok',
    'Gojo Satoru',
    'Chen Zheyuan',
    'Donald Trump',
    'Song Eunseok',
    'Gojo Satoru',
    'Chen Zheyuan',
    'Donald Trump',
    'Song Eunseok',
    'Gojo Satoru',
    'Chen Zheyuan',
    'Donald Trump',
    'Song Eunseok',
    'Gojo Satoru',
    'Chen Zheyuan',
    'Donald Trump',
    'Song Eunseok',
  ];
  List<String> message = [
    "Halo gais",
    "OK siap",
    "Sebaiknya kita valo saja",
    'Hehehehe iya',
    'NOOOO',
    "Halo gais",
    "OK siap",
    "Sebaiknya kita valo saja",
    'Hehehehe iya',
    'NOOOO',
    "Halo gais",
    "OK siap",
    "Sebaiknya kita valo saja",
    'Hehehehe iya',
    'NOOOO',
    "Halo gais",
    "OK siap",
    "Sebaiknya kita valo saja",
    'Hehehehe iya',
    'NOOOO',
  ];

  List<String> time = [
    '10.30',
    '10.30',
    '10.30',
    '10.30',
    '10.30',
    '10.30',
    '10.30',
    '10.30',
    '10.30',
    '10.30',
    '10.30',
    '10.30',
    '10.30',
    '10.30',
    '10.30',
    '10.00',
    '10.00',
    '10.00',
    '10.00',
    '10.00',
    '10.00',
    '10.00',
    '10.00',
    '10.00',
    '10.00',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APPBAR
      appBar: AppBar(
        toolbarHeight: 110,
        leadingWidth: double.maxFinite,
        backgroundColor: AppColors.bgDarkMode,
        elevation: 0.0,
        leading: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  const Padding(padding: EdgeInsets.all(5)),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const FaIcon(
                      Icons.arrow_back,
                      color: AppColors.white,
                      size: 25,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 300,
                    child: Text(
                      'Chats',
                      style: TextStyles.GR_24_bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const FaIcon(
                      FontAwesomeIcons.penToSquare,
                      color: AppColors.white,
                      size: 25,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomSearchBar()
            ],
          ),
        ),
      ),

      //BODY
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(photo.elementAt(index)),
            ),
            title: Text(
              name.elementAt(index),
              style: TextStyles.bold_18,
            ),
            subtitle: Text(
              message.elementAt(index),
              style: TextStyles.medium_14,
            ),
            trailing: Text(
              time.elementAt(index),
              style: TextStyles.GR_12_light,
            ), // Last message time
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
