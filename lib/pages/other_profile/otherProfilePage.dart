import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/pages/add_schedule_notes/addShareNotes.dart';
import 'package:selamat_application/pages/add_schedule_notes/addShareSchedule.dart';
import 'package:selamat_application/pages/home_page/homePage.dart';
import 'package:selamat_application/pages/profile_page/editProfile.dart';
import 'package:selamat_application/pages/profile_page/profileSharedSchedule.dart';
import 'package:selamat_application/pages/settings_page/settingsPage.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/widget_schedule/scheduleBox.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

class OtherProfilePage extends StatefulWidget {
  const OtherProfilePage({super.key});

  @override
  State<OtherProfilePage> createState() => _OtherProfilePageState();
}

class _OtherProfilePageState extends State<OtherProfilePage> {
  bool _isFollowed = false;
  @override
  Widget build(BuildContext context) {
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
                      builder: (context) => SettingsPage(),
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
                      image: AssetImage("assets/images/discovery_page/gym.png"),
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
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                            "assets/images/home_page/gojosatoru.png"),
                      ),
                    ),
                    const SizedBox(
                      width: 110,
                    ),
                    Container(
                        transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                        child: CustomElevatedButton(
                          text: _isFollowed ? 'Followed' : "Follow",
                          buttonStyle: _isFollowed
                              ? CustomButtonStyles.buttonGray3
                              : CustomButtonStyles.buttonGrey2,
                          buttonTextStyle: TextStyles.medium_18,
                          width: 140,
                          height: 35,
                          onPressed: () {
                            setState(() {
                              _isFollowed = !_isFollowed;
                            });
                          },
                        ))
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
                      "Gojo Satoru",
                      style: TextStyles.bold_24,
                    ),

                    //USERNAME
                    Text(
                      "@gojosatoru",
                      style: TextStyles.light_16,
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //DESKRIPSI PROFILE
                    Text(
                      "saya adalah penyihir terkuat sepanjang masa, jadi jika anda ingin melihat kehebatan, follow saya.",
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
                          "13 Desember 1998",
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
                          "Bergabung Juni 2017",
                          style: TextStyles.profile_text,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //MUTUALS
                    Text(
                      "62 Mutuals",
                      style: TextStyles.bold_16,
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //Send Message
                    CustomElevatedButton(
                      height: 40,
                      text: "Send Message",
                      buttonStyle: CustomButtonStyles.buttonNotSure,
                      buttonTextStyle: TextStyles.bold_18,
                    ),

                    //TAMPUNG PAGE VIEW
                    const SizedBox(
                      height: 700,
                      child: Page_View2(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Page_View2 extends StatefulWidget {
  const Page_View2({super.key});

  @override
  State<Page_View2> createState() => _Page_View2State();
}

class _Page_View2State extends State<Page_View2> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  final List<Widget> _pages = [
    const ScheduleView2(),
    const NotesView2(),
  ];

  void _onTap(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
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
                          ? AppColors.pastelGreenHealth
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
                          ? AppColors.pastelGreenHealth
                          : Colors.white54),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

//HALAMAN 1
class ScheduleView2 extends StatelessWidget {
  const ScheduleView2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(padding: EdgeInsets.all(30)),
        //BOX BUAT SHARE SCHEDULE

        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}

class NotesView2 extends StatelessWidget {
  const NotesView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.all(30)),
        const SizedBox(
          height: 50,
        ),
        Container(
          height: 180,
          width: 180,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white),
          ),
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.bookmark,
              size: 60,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
