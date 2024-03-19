import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:selamat_application/models/user.dart' as u;
import 'package:selamat_application/pages/add_schedule_notes/addShareNotes.dart';
import 'package:selamat_application/pages/add_schedule_notes/addShareSchedule.dart';
import 'package:selamat_application/pages/profile_page/editProfile.dart';
import 'package:selamat_application/pages/settings_page/settingsPage.dart';
import 'package:selamat_application/providers/user_provider.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/activity_widget/activity_card.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';
import 'package:selamat_application/widget/widget_schedule/notesBox.dart';
import 'package:selamat_application/widget/widget_schedule/scheduleBox.dart';

class NewProfilePage extends StatefulWidget {
  const NewProfilePage({super.key});

  @override
  State<NewProfilePage> createState() => _NewProfilePageState();
}

class _NewProfilePageState extends State<NewProfilePage> {
  @override
  Widget build(BuildContext context) {
    final u.User user = Provider.of<UserProvider>(context).getUser;
    return SafeArea(
      child: Scaffold(
        //APPBAR
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 60,
          leadingWidth: double.maxFinite,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Row(
            children: [
              const Padding(padding: EdgeInsets.all(5)),
              SizedBox(
                width: 330,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const FaIcon(
                    Icons.arrow_back,
                    color: AppColors.white,
                    size: 25,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ),
                  );
                },
                child: const FaIcon(
                  Icons.settings,
                  color: Colors.white,
                  size: 25,
                ),
              )
            ],
          ),
        ),

        //BODY
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //SAMPUL PROFILE
              Container(
                height: 150,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/discovery_page/running.png"),
                      fit: BoxFit.cover),
                ),
              ),

              //FOTO DAN EDIT PROFILE
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Container(
                      transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: user.profilePicUrl == ""
                            ? NetworkImage(
                                'https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg')
                            : NetworkImage(user.profilePicUrl),
                      ),
                    ),
                    const SizedBox(
                      width: 110,
                    ),
                    Container(
                      transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                      child: CustomElevatedButton(
                        text: "Edit Profile",
                        buttonStyle: CustomButtonStyles.buttonGray3,
                        buttonTextStyle: TextStyles.medium_18,
                        width: 140,
                        height: 35,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditProfile(),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),

              //MULAI KONTEN
              Container(
                transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //NAMA USER
                    Text(
                      user.fullName,
                      style: TextStyles.bold_24,
                    ),

                    //USERNAME
                    Text(
                      user.email,
                      style: TextStyles.light_16,
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //DESKRIPSI PROFILE
                    Text(
                      "bukan ambis, tetapi optimis. semoga bisa menjadi yang terbaik demi masa depan. Saya suka main game, tetapi tetap rajin dalam belajar.",
                      style: TextStyles.light_16,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //DOB USER
                    Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.cakeCandles,
                          size: 20,
                          color: AppColors.inactiveText,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "22 Januari 2001",
                          style: TextStyles.profile_text,
                        )
                      ],
                    ),

                    //TANGGAL BERGABUNG
                    Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.calendarCheck,
                          size: 20,
                          color: AppColors.inactiveText,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Bergabung Juni 2019",
                          style: TextStyles.profile_text,
                        )
                      ],
                    ),

                    //KETERANGAN
                    const Center(
                      child: SizedBox(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ContainerAssets(
                              num: 4,
                              info: 'Posts',
                            ),
                            ContainerAssets(num: 782, info: 'mutuals'),
                            ContainerAssets(num: 42, info: 'habits'),
                          ],
                        ),
                      ),
                    ),

                    //TAMPUNG PAGE VIEW
                    const SizedBox(
                      height: 700,
                      child: Page_View(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddShareSchedule(),
                          ),
                        );
                      },
                      leading: const FaIcon(
                        Icons.calendar_month_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      title: Text(
                        "Share Schedule",
                        style: TextStyles.medium_24,
                      ),
                    ),
                    const Divider(
                      color: AppColors.activeCalendar,
                      thickness: 1,
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddShareNotes(),
                          ),
                        );
                      },
                      leading: const FaIcon(
                        Icons.note_add,
                        color: Colors.white,
                        size: 30,
                      ),
                      title: Text(
                        "Create A Note",
                        style: TextStyles.medium_24,
                      ),
                    ),
                  ],
                ),
                behavior: SnackBarBehavior.fixed,
              ),
            );
          },
          shape: const CircleBorder(),
          backgroundColor: AppColors.baseColor,
          child: const FaIcon(
            FontAwesomeIcons.pencil,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// BUAT CONTAINER
class ContainerAssets extends StatefulWidget {
  final int num;
  final String info;
  const ContainerAssets({super.key, required this.num, required this.info});

  @override
  State<ContainerAssets> createState() => _ContainerAssetsState();
}

class _ContainerAssetsState extends State<ContainerAssets> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.amber,
      height: 80,
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${widget.num}',
            style: TextStyles.bold_18,
          ),
          Text(
            widget.info,
            style: TextStyles.light_14,
          )
        ],
      ),
    );
  }
}

//PAGE VIEW
// ignore: camel_case_types
class Page_View extends StatefulWidget {
  const Page_View({super.key});

  @override
  State<Page_View> createState() => _Page_ViewState();
}

// ignore: camel_case_types
class _Page_ViewState extends State<Page_View> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  final List<Widget> _pages = [
    const ScheduleView(),
    const NotesView(),
  ];

  void _onTap(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
      Container(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                _onTap(0);
              },
              child: Text(
                "Schedule",
                style: TextStyle(
                    fontFamily: 'Samsung Sans',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: _currentPageIndex == 0
                        ? AppColors.baseColor
                        : Colors.white54),
              ),
            ),
            GestureDetector(
              onTap: () {
                _onTap(1);
              },
              child: Text(
                "Notes",
                style: TextStyle(
                    fontFamily: 'Samsung Sans',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: _currentPageIndex == 1
                        ? AppColors.baseColor
                        : Colors.white54),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}

//HALAMAN 1
class ScheduleView extends StatefulWidget {
  const ScheduleView({super.key});

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('activities')
          .where('uid', isEqualTo: _auth.currentUser!.uid)
          .where('isNotes', isEqualTo: false)
          // .orderBy('datePublished', descending: true)
          .snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
            itemCount: snapshot.data?.docs.length ?? 0,
            itemBuilder: (context, index) {
              return ActivityCard(snap: snapshot.data!.docs[index].data());
            });
      },
    );
  }
}

//PAGE 2
class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('activities')
          .where('uid', isEqualTo: _auth.currentUser!.uid)
          .where('isNotes', isEqualTo: true)
          // .orderBy('datePublished', descending: true)
          .snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
            itemCount: snapshot.data?.docs.length ?? 0,
            itemBuilder: (context, index) {
              return ActivityCard(snap: snapshot.data!.docs[index].data());
            });
      },
    );
  }
}
