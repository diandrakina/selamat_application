import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:selamat_application/models/user.dart';
import 'package:selamat_application/pages/schedule_page/allSchedule.dart';
import 'package:selamat_application/pages/schedule_page/schedule_page_view.dart';
import 'package:selamat_application/pages/schedule_page/toDoList.dart';
import 'package:selamat_application/providers/user_provider.dart';
import 'package:selamat_application/resources/firestore_methods.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({
    super.key,
  });

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  void createEmotefromTask(uid) async {
    int x = await FirestoreMethods().numOfTaskDone(uid);
    int y = await FirestoreMethods().numOfTaskToday(uid);
    print('DONE TAKSSSSSSSS${x}');
    print('TAKSSSSSSSS${y}');
    print(x/y);
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    createEmotefromTask(user.uid);
    /*
  status = 0 -> belum masuk tanggalnya
  status = 1 -> happy
  status = 2 -> biasa aja
  status = 3 -> sedih
  */

  List<int> statttt = List.filled(31, 0);
  DateTime today = DateTime.now();
  DateTime currentDate = DateTime(today.year, today.month, today.day);
  statttt[currentDate.day] = 1;
  print(statttt);

    // List<int> statttt = [
    //   1,
    //   2,
    //   3,
    //   2,
    //   1,
    //   2,
    //   1,
    //   3,
    //   2,
    //   1,
    //   1,
    //   2,
    //   3,
    //   2,
    //   1,
    //   2,
    //   1,
    //   3,
    //   2,
    //   1,
    //   0,
    //   0,
    //   0,
    //   0,
    //   0,
    //   0,
    //   0,
    //   0,
    //   0,
    //   0,
    //   0,
    //   0
    // ];

    FaIcon _iconMood(int status, bool isSelected, isPressed) {
      switch (status) {
        case 1:
          return FaIcon(
            FontAwesomeIcons.solidFaceFrown,
            color: isSelected ? AppColors.white : AppColors.pastelRed,
            size: 40.0,
          );

        case 2:
          return FaIcon(
            FontAwesomeIcons.solidFaceMeh,
            color: isSelected ? AppColors.white : AppColors.successStreak,
            size: 40.0,
          );

        case 3:
          return FaIcon(
            FontAwesomeIcons.solidFaceLaugh,
            color: isSelected ? AppColors.white : AppColors.pastelGreenHealth,
            size: 40.0,
          );

        default:
          return FaIcon(
            FontAwesomeIcons.circle,
            color: isSelected ? AppColors.white : AppColors.activeCalendar,
            size: 40.0,
          );
      }
    }

    return SafeArea(
      child: Scaffold(
        //APPBAR
        appBar: AppBar(
          toolbarHeight: 220,
          leadingWidth: double.maxFinite,
          backgroundColor: AppColors.bgDarkMode,
          leading: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                EasyDateTimeLine(
                  initialDate: DateTime.now(),
                  onDateChange: (selectedDate) {
                    //selectedDate
                  },

                  //HEADER
                  headerProps: EasyHeaderProps(
                      monthPickerType: MonthPickerType.switcher,
                      // ignore: deprecated_member_use
                      selectedDateFormat:
                          SelectedDateFormat.fullDateDMonthAsStrY,
                      monthStyle: TextStyles.bold_24,
                      selectedDateStyle: TextStyles.bold_24),

                  //CONTAINER DAY
                  dayProps: const EasyDayProps(
                    height: 130,
                    width: 70,
                  ),

                  //TIMELINE
                  timeLineProps: const EasyTimeLineProps(separatorPadding: 8),

                  //DAYBUILDER
                  itemBuilder: ((
                    context,
                    dayNumber,
                    dayName,
                    monthName,
                    fullDate,
                    isSelected,
                  ) {
                    bool isPressed = false;

                    return Container(
                      height: 130,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                            bottomLeft: Radius.circular(32),
                            bottomRight: Radius.circular(32),
                          ),
                          color: isSelected
                              ? AppColors.baseColor
                              : AppColors.inactiveCalendar),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isSelected
                                  ? AppColors.baseColor
                                  : AppColors.activeCalendar,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(dayName, style: TextStyles.regular_14),
                                Text(
                                  dayNumber,
                                  style: TextStyles.bold_16,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),

                          //ICON
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _iconMood(
                                    statttt.elementAt(int.parse(dayNumber)),
                                    isSelected,
                                    isPressed)
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),

        //BODY
        body: Container(
          height: 1000,
          width: double.maxFinite,

          //PAGE VIEW
          child: SchedulePageView(),

        ),

        //Floating button
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ToDoList(),
              ),
            );
          },
          backgroundColor: AppColors.activeCalendar,
          child: const FaIcon(
            FontAwesomeIcons.plus,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}


class PageView2 extends StatefulWidget {
  const PageView2({super.key});

  @override
  State<PageView2> createState() => _PageView2State();
}

class _PageView2State extends State<PageView2> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  final List<Widget> _pages = [
    const AllSchedule(),
    const AllSchedule(),
    const AllSchedule(),
    const AllSchedule(),
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
    return Stack(
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
                      _onTap(0);
                    },
                    text: "All",
                    buttonTextStyle: TextStyles.bold_18,
                    height: 40,
                    width: 92,
                    buttonStyle: _currentPageIndex == 0
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
                      _onTap(1);
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
                    buttonStyle: _currentPageIndex == 1
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
                      _onTap(2);
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
                    buttonStyle: _currentPageIndex == 2
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
                      _onTap(3);
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
                    buttonStyle: _currentPageIndex == 3
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

