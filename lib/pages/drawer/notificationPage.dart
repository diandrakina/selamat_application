import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  final List<Widget> _pages = [TasksNotif(), FriendsNotif()];

  void _onTap(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 100),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          leadingWidth: double.maxFinite,
          elevation: 0.0,
          backgroundColor: AppColors.bgDarkMode,
          leading: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
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
                    const Padding(padding: EdgeInsets.all(5)),
                    Text(
                      "Notification",
                      style: TextStyles.bold_30,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        //BODY
        body: SingleChildScrollView(
          child: SizedBox(
            height: 1000,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPageIndex = page;
                    });
                  },
                  itemCount: _pages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _pages[index % _pages.length];
                  },
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _onTap(0);
                        },
                        child: Container(
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                            color: _currentPageIndex == 0
                                ? AppColors.baseColor
                                : AppColors.inactiveCalendar,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Tasks",
                                style: TextStyles.bold_18,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _onTap(1);
                        },
                        child: Container(
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                            color: _currentPageIndex == 1
                                ? AppColors.baseColor
                                : AppColors.inactiveCalendar,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Friends",
                                style: TextStyles.bold_18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TasksNotif extends StatefulWidget {
  const TasksNotif({super.key});

  @override
  State<TasksNotif> createState() => _TasksNotifState();
}

class _TasksNotifState extends State<TasksNotif> {
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
  List<String> username = [
    'gojosatoru',
    'chenzheyuan',
    'donaldtrump',
    'songeunseok',
    'gojosatoru',
    'chenzheyuan',
    'donaldtrump',
    'songeunseok',
    'gojosatoru',
    'chenzheyuan',
    'donaldtrump',
    'songeunseok',
    'gojosatoru',
    'chenzheyuan',
    'donaldtrump',
    'songeunseok',
    'gojosatoru',
    'chenzheyuan',
    'donaldtrump',
    'songeunseok',
  ];
  List<String> activity = [
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
  List<int> hour = [1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40),
      child: ListView.builder(
        itemCount: 20, // Assuming there are 20 recent chats
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(photo.elementAt(index)),
            ),
            title: Row(
              children: [
                Text(
                  '@${username.elementAt(index)}',
                  style: TextStyles.bold_18,
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    activity.elementAt(index),
                    style: TextStyles.medium_14,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

            trailing: Text(
              '${hour.elementAt(index)}h',
              style: TextStyles.GR_12_light,
            ), // Last message time
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ChatScreen(),
              //   ),
              // );
            },
          );
        },
      ),
    );
  }
}

class FriendsNotif extends StatefulWidget {
  const FriendsNotif({super.key});

  @override
  State<FriendsNotif> createState() => _FriendsNotifState();
}

class _FriendsNotifState extends State<FriendsNotif> {
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
  List<String> username = [
    'gojosatoru',
    'chenzheyuan',
    'donaldtrump',
    'songeunseok',
    'gojosatoru',
    'chenzheyuan',
    'donaldtrump',
    'songeunseok',
    'gojosatoru',
    'chenzheyuan',
    'donaldtrump',
    'songeunseok',
    'gojosatoru',
    'chenzheyuan',
    'donaldtrump',
    'songeunseok',
    'gojosatoru',
    'chenzheyuan',
    'donaldtrump',
    'songeunseok',
  ];
  List<String> activity = [
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
  List<int> hour = [1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40),
      child: ListView.builder(
        itemCount: 20, // Assuming there are 20 recent chats
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(photo.elementAt(index)),
            ),
            title: Row(
              children: [
                Text(
                  '@${username.elementAt(index)}',
                  style: TextStyles.bold_18,
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    activity.elementAt(index),
                    style: TextStyles.medium_14,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

            trailing: Text(
              '${hour.elementAt(index)}h',
              style: TextStyles.GR_12_light,
            ), // Last message time
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ChatScreen(),
              //   ),
              // );
            },
          );
        },
      ),
    );
  }
}
