import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/utils/global_variable.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

class SchedulePageView extends StatefulWidget {
  const SchedulePageView({super.key});

  @override
  State<SchedulePageView> createState() => _SchedulePageViewState();
}

class _SchedulePageViewState extends State<SchedulePageView> {
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

  // void _onTap(int pageIndex) {
  //   _pageController.animateToPage(
  //     pageIndex,
  //     duration: Duration(milliseconds: 300),
  //     curve: Curves.ease,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          children: scheduleScreenItems,
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: onPageChanged,
        ),
            Container(
          padding: const EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),

                //All
                GestureDetector(
                  child: CustomElevatedButton(
                    onPressed: () {
                      navigationTapped(0);
                    },
                    text: "All",
                    buttonTextStyle: TextStyles.bold_18,
                    height: 40,
                    width: 92,
                    buttonStyle: _page == 0
                        ? CustomButtonStyles.buttonBlue2  
                        : CustomButtonStyles.buttonGrey2,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),

                //Morning
                GestureDetector(
                  child: CustomElevatedButton(
                    onPressed: () {
                      navigationTapped(1);
                    },
                    text: "  Morning",
                    leftIcon: const FaIcon(
                      FontAwesomeIcons.sun,
                      color: Colors.white,
                      size: 20,
                    ),
                    buttonTextStyle: TextStyles.bold_18,
                    height: 40,
                    width: 150,
                    buttonStyle: _page == 1
                        ? CustomButtonStyles.buttonBlue2
                        : CustomButtonStyles.buttonGrey2,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),

                //Afternoon
                GestureDetector(
                  child: CustomElevatedButton(
                    onPressed: () {
                      navigationTapped(2);
                    },
                    text: "  Afternoon",
                    leftIcon: const FaIcon(
                      FontAwesomeIcons.sun,
                      color: Colors.white,
                      size: 20,
                    ),
                    buttonTextStyle: TextStyles.bold_18,
                    height: 40,
                    width: 165,
                    buttonStyle: _page == 2
                        ? CustomButtonStyles.buttonBlue2
                        : CustomButtonStyles.buttonGrey2,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),

                //Evening
                GestureDetector(
                  child: CustomElevatedButton(
                    onPressed: () {
                      navigationTapped(3);
                    },
                    text: "  Evening",
                    leftIcon: const FaIcon(
                      FontAwesomeIcons.moon,
                      color: Colors.white,
                      size: 20,
                    ),
                    buttonTextStyle: TextStyles.bold_18,
                    height: 40,
                    width: 140,
                    buttonStyle: _page == 3
                        ? CustomButtonStyles.buttonBlue2
                        : CustomButtonStyles.buttonGrey2,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
  //   return Stack(
  //     children: [
  //       PageView.builder(
  //         controller: _pageController,
  //         onPageChanged: (int page) {
  //           setState(() {
  //             _currentPageIndex = page;
  //           });
  //         },
  //         itemCount: _pages.length,
  //         itemBuilder: (BuildContext context, int index) {
  //           return _pages[index % _pages.length];
  //         },
  //       ),
