import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/pages/schedule_page/categoriesPage.dart';
import 'package:selamat_application/pages/schedule_page/schedulePage.dart';
import 'package:selamat_application/pages/schedule_page/visibilityPage.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  bool _darkMode = false;
  bool _notification = false;
  bool _reminder = false;
  bool _location = false;
  bool _isDay = false;

  int? selectedDay;

  _onButtonTapped(int? index) {
    setState(() {
      if (selectedDay == index) {
        selectedDay = null;
      } else {
        selectedDay = index;
      }
    });
  }

  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //APPBAR
        appBar: AppBar(
          toolbarHeight: 60,
          leadingWidth: double.maxFinite,
          elevation: 0.0,
          backgroundColor: AppColors.bgDarkMode,
          leading: Row(
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
                width: 250,
              ),
              CustomElevatedButton(
                text: "Save",
                buttonStyle: CustomButtonStyles.buttonBlue,
                buttonTextStyle: TextStyles.bold_14,
                height: 30,
                width: 80,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SchedulePage(),
                    ),
                  );
                },
              )
            ],
          ),
        ),

        //BODY
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'assets/images/login_page/facebook_logo.png', // Adjust the path to your logo
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //ADD TITLE
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.pastelGreenHealth),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Add Title',
                          style: TextStyles.bold_30,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const FaIcon(
                          FontAwesomeIcons.pen,
                          color: Colors.white,
                          size: 20,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //CONTENT
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //DATE AND TIMES
                    Text(
                      'Date and Times',
                      style: TextStyles.bold_24,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.inactiveTask,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          ListTile(
                            title: Row(
                              children: [
                                const FaIcon(
                                  Icons.calendar_month,
                                  color: AppColors.white,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Start Date',
                                  style: TextStyles.light_18,
                                ),
                              ],
                            ),
                            trailing: Text(
                              'Wed, 22 Nov 2023',
                              style: TextStyles.light_18,
                            ), // Add your logic for language selection here
                            onTap: () {
                              // Add logic for language selection here
                            },
                          ),
                          const Divider(
                            height: 5,
                          ),
                          ListTile(
                            title: Row(
                              children: [
                                const FaIcon(
                                  Icons.alarm,
                                  color: AppColors.white,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Time',
                                  style: TextStyles.light_18,
                                ),
                              ],
                            ),
                            trailing: Text('19:00 >',
                                style: TextStyles
                                    .light_18), // Add your logic for language selection here
                            onTap: () {
                              // Add logic for language selection here
                            },
                          ),
                          const Divider(
                            height: 5,
                          ),
                          Column(
                            children: [
                              SwitchListTile(
                                activeColor: AppColors.baseColor,
                                inactiveTrackColor: AppColors.inactiveTask,
                                inactiveThumbColor: Colors.white,
                                title: Row(
                                  children: [
                                    const Icon(Icons.repeat,
                                        color: AppColors.white),
                                    const SizedBox(width: 10),
                                    Text('Repeat', style: TextStyles.light_18),
                                  ],
                                ),
                                value: _notification,
                                onChanged: (bool value) {
                                  setState(
                                    () {
                                      _notification = value;
                                    },
                                  );
                                },
                              ),

                              //CONDITION TRUE
                              if (_notification)
                                Container(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        _repeatedDay("M", 0),
                                        _repeatedDay("T", 1),
                                        _repeatedDay("W", 2),
                                        _repeatedDay("T", 3),
                                        _repeatedDay("F", 4),
                                        _repeatedDay("S", 5),
                                        _repeatedDay("S", 6),
                                      ],
                                    ))
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //TASK DETAILS
                    Text(
                      'Task Details',
                      style: TextStyles.bold_24,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.inactiveTask,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            title: Row(
                              children: [
                                const Icon(Icons.visibility,
                                    color: AppColors.white),
                                const SizedBox(width: 10),
                                Text('Visibility', style: TextStyles.light_18),
                              ],
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const VisibilityPage(),
                                  ),
                                );
                              },
                              child:
                                  Text('Public >', style: TextStyles.light_18),
                            ), // Add your logic for language selection here
                          ),
                          const Divider(
                            height: 5,
                          ),
                          ListTile(
                            title: Row(
                              children: [
                                const Icon(Icons.category,
                                    color: AppColors.white),
                                const SizedBox(width: 10),
                                Text('Category', style: TextStyles.regular_18),
                              ],
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CategoriesPage(),
                                  ),
                                );
                              },
                              child: Text('None >', style: TextStyles.light_18),
                            ), // Add your logic for language selection here
                          ),
                          const Divider(
                            height: 5,
                          ),
                          ListTile(
                            leading: const Icon(Icons.description,
                                color: AppColors.white),
                            title:
                                Text('Description', style: TextStyles.light_18),
                            subtitle: TextField(
                              controller: _textFieldController,
                              decoration: InputDecoration(
                                  hintText: "Add some description",
                                  hintStyle: TextStyles.light_14),
                              onChanged: (text) {
                                // Handle changes to the text field
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //REMINDERS
                    Text(
                      'Reminders',
                      style: TextStyles.bold_24,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.inactiveTask,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          SwitchListTile(
                            activeColor: AppColors.baseColor,
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: AppColors.inactiveTask,
                            title: Row(
                              children: [
                                const Icon(
                                  Icons.notifications_on,
                                  color: AppColors.white,
                                ),
                                const SizedBox(width: 10),
                                Text('Reminder', style: TextStyles.light_18),
                              ],
                            ),
                            value: _reminder,
                            onChanged: (bool value) {
                              setState(() {
                                _reminder = value;
                              });
                            },
                          ),

                          //CONDITION TRUE
                          if (_reminder)
                            Container(
                              padding: EdgeInsets.zero,
                              child: Column(
                                children: [
                                  const Divider(
                                    height: 5,
                                  ),
                                  ListTile(
                                    leading: const FaIcon(
                                        FontAwesomeIcons.bullhorn,
                                        color: AppColors.white),
                                    title: Text('Encouragement',
                                        style: TextStyles.light_18),
                                    subtitle: TextField(
                                      controller: _textFieldController,
                                      decoration: InputDecoration(
                                          hintText: "Add some description",
                                          hintStyle: TextStyles.light_14),
                                      onChanged: (text) {
                                        // Handle changes to the text field
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _repeatedDay(String day, int index) {
    return GestureDetector(
      onTap: () {
        _onButtonTapped(index);
      },
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: selectedDay == index
              ? AppColors.baseColor
              : AppColors.activeCalendar,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            day,
            style: TextStyles.bold_18,
          ),
        ),
      ),
    );
  }
}
