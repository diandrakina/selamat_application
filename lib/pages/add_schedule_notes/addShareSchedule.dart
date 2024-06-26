import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:selamat_application/models/user.dart';
import 'package:selamat_application/pages/activity_page/activityPage.dart';
import 'package:selamat_application/providers/user_provider.dart';
import 'package:selamat_application/resources/firestore_methods.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

class AddShareSchedule extends StatefulWidget {
  const AddShareSchedule({
    super.key,
  });

  @override
  State<AddShareSchedule> createState() => _AddShareScheduleState();
}

class _AddShareScheduleState extends State<AddShareSchedule> {
  bool _isNotes = false;
  String _desc = '';
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime(2022, 1, 1, 0, 0);
  String _status = 'Public';

  bool _isPicked = false;

  void updateStatusValue(String newValue) {
    setState(() {
      _status = newValue;
    });
    print(_status);
  }

  void pickDateRange() async {
    final ThemeData themeData = Theme.of(context);
    final ThemeData dialogTheme = ThemeData.dark().copyWith(
      colorScheme: themeData.colorScheme.copyWith(
        primary: Colors.blue, // Change primary color
      ),
      textTheme: themeData.textTheme.copyWith(
        bodyText1: TextStyle(color: Colors.white), // Set all text to white
      ),
      backgroundColor: Colors.grey[900], // Adjust background color
    );

    final DateTimeRange? dateTime = await showDateRangePicker(
      context: context,
      initialDateRange: DateTimeRange(
        start: DateTime.now(),
        end: DateTime.now().add(Duration(days: 7)),
      ),
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(Duration(days: 365)),
      helpText: 'Select Date Range',
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: dialogTheme,
          child: child!,
        );
      },
    );
    if (dateTime != null) {
      setState(() {
        _startDate = dateTime.start;
        _endDate = dateTime.end;
        _isPicked = true;
        print(_startDate);
        print(_endDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    return SafeArea(
      child: Scaffold(
        appBar:
            //APPBAR
            AppBar(
          toolbarHeight: 80,
          leadingWidth: double.maxFinite,
          leading: Container(
            padding: const EdgeInsets.only(left: 5),
            color: AppColors.bgDarkMode,
            child: Row(
              children: [
                const Padding(padding: EdgeInsets.all(5)),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const FaIcon(
                    FontAwesomeIcons.xmark,
                    color: AppColors.white,
                    size: 30,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                SizedBox(
                  width: 300,
                  child: Text(
                    "Share Schedule",
                    style: TextStyles.bold_30,
                  ),
                ),
              ],
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,

        //BODY
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //CAPTION
                Text(
                  "Caption",
                  style: TextStyles.regular_18,
                ),
                TextField(
                  style: TextStyles.regular_18,
                  onChanged: (value) {
                    setState(() {
                      _desc = value;
                    });
                  },
                  decoration:
                      const InputDecoration(border: UnderlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),

                //DATE PICKER
                Text(
                  "Select date",
                  style: TextStyles.regular_18,
                ),
                TextField(
                  style: const TextStyle(
                      color: AppColors.white, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_month),
                      onPressed: pickDateRange,
                      color: AppColors.white,
                    ),
                    hintStyle: TextStyles.GR_14_light,
                    // hintStyle: TextStyle(
                    //     color: AppColors.white, fontWeight: FontWeight.w400),
                    hintText: _isPicked
                        ? "${_startDate.day}-${_startDate.month}-${_startDate.year} Until ${_endDate.day}-${_endDate.month}-${_endDate.year}"
                        : "Pick date range",
                  ),
                  keyboardType: TextInputType.text,
                  readOnly: true,
                ),

                const SizedBox(
                  height: 20,
                ),

                //VISIBILITY
                Row(
                  children: [
                    SizedBox(
                      width: 180,
                      child: Text(
                        "Visibility",
                        style: TextStyles.regular_18,
                      ),
                    ),
                    DropdownButton<String>(
                      value: _status,
                      onChanged: (String? newVal) {
                        updateStatusValue(newVal!);
                      },
                      dropdownColor: AppColors.inactiveCalendar,
                      icon: const Icon(Icons.arrow_drop_down),
                      style: TextStyles.regular_18,
                      items: const [
                        DropdownMenuItem<String>(
                          value: "Mutuals",
                          child: SizedBox(
                            child: Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.userGroup,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Mutuals Only")
                              ],
                            ),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: "Public",
                          child: SizedBox(
                            child: Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.globe,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Public")
                              ],
                            ),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: "Private",
                          child: SizedBox(
                            child: Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.lock,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Private")
                              ],
                            ),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: "Category",
                          child: SizedBox(
                            child: Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.clipboardList,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Category Only")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomElevatedButton(
          margin: const EdgeInsets.all(20),
          height: 50,
          text: "Share",
          buttonStyle: CustomButtonStyles.buttonBlue,
          buttonTextStyle: TextStyles.bold_18,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: AppColors.darkModeCard,
                  content: Container(
                    padding: const EdgeInsets.all(5),
                    height: 180,
                    width: 380,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Save Changes",
                          style: TextStyles.bold_24,
                        ),
                        Text(
                          "Are you sure want to save the changes you made?",
                          style: TextStyles.light_18,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 100,
                            ),
                            GestureDetector(
                              child: Text(
                                "No Thanks",
                                style: TextStyles.alertGrey,
                              ),
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              child: Text(
                                "Save",
                                style: TextStyles.alertBlue,
                              ),
                              onTap: () {
                                FirestoreMethods().addActivity(
                                  _isNotes,
                                  user.uid,
                                  user.profilePicUrl,
                                  user.fullName,
                                  _desc,
                                  _startDate,
                                  _endDate,
                                  _status,
                                );
                                Navigator.of(context)
                                    .popUntil((route) => route.isFirst);
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
