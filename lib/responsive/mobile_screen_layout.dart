import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:selamat_application/providers/user_provider.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/utils/global_variable.dart';
// import 'package:instagram_clone/providers/user_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:instagram_clone/models/user.dart' as model;

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController;
  

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = AppColors.white;
    Color secondaryColor = Colors.white54;


    return Scaffold(
      body: PageView(
        children: homeScreenItems,
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.darkModeCard,
            onTap: navigationTapped,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 32,
                    color: _page == 0 ? primaryColor : secondaryColor,
                  ),
                  label: '',
                  backgroundColor: primaryColor),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    size: 32,
                    color: _page == 1 ? primaryColor : secondaryColor,
                  ),
                  label: '',
                  backgroundColor: primaryColor),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.calendar_month,
                    size: 32,
                    color: _page == 2 ? primaryColor : secondaryColor,
                  ),
                  label: '',
                  backgroundColor: primaryColor),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.running,
                    size: 32,
                    color: _page == 3 ? primaryColor : secondaryColor,
                  ),
                  label: '',
                  backgroundColor: primaryColor),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.chartSimple,
                    size: 32,
                    color: _page == 4 ? primaryColor : secondaryColor,
                  ),
                  label: '',
                  backgroundColor: primaryColor),
            ],
          ),
        ),
      ),
    );
  }
}
