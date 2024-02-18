import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedTabIndex = 0;
  void _onNavBarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _listPage = <Widget>[
      const Text('HomePage'),
      const Text('Search'),
      const Text('Schedule'),
      const Text('Progress'),
      const Text('Profile')
    ];

    final _bottomNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 32,
          ),
          label: 'HomePage'),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            size: 32,
          ),
          label: 'Search'),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.calendar_month,
            size: 32,
          ),
          label: 'Schedule'),
      const BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.running,
            size: 29,
          ),
          label: 'Progress'),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            size: 32,
          ),
          label: 'Profile'),
    ];

    final _bottomNavBar = BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.darkModeCard,
      items: _bottomNavBarItems,
      currentIndex: _selectedTabIndex,
      unselectedItemColor: Colors.white54,
      selectedItemColor: AppColors.white,
      onTap: _onNavBarTapped,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );

    return SizedBox(
      height: 70,
      child: Scaffold(
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          child: _bottomNavBar,
        ),
      ),
    );
  }
}
