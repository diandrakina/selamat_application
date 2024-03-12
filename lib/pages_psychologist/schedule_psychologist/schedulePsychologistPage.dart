import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

class SchedulePsychologistPage extends StatefulWidget {
  const SchedulePsychologistPage({super.key});

  @override
  State<SchedulePsychologistPage> createState() =>
      _SchedulePsychologistPageState();
}

class _SchedulePsychologistPageState extends State<SchedulePsychologistPage> {
  @override
  Widget build(BuildContext context) {
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
                  dayProps: EasyDayProps(
                      height: 100,
                      width: 70,
                      todayHighlightColor: AppColors.bluePowder,
                      // ignore: deprecated_member_use
                      activeDayDecoration: BoxDecoration(
                        color: AppColors.baseColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      // ignore: deprecated_member_use
                      inactiveDayNumStyle: TextStyles.light_14,
                      // ignore: deprecated_member_use
                      activeDayNumStyle: TextStyles.bold_30),

                  //TIMELINE
                  timeLineProps: EasyTimeLineProps(separatorPadding: 8),
                ),
              ],
            ),
          ),
        ),

        //BODY
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                _buildPatientBox(
                    "Abraham Mahayana Setiawan", "08.00 - 09.00", "P001"),
                const SizedBox(
                  height: 10,
                ),
                _buildPatientBox("Felix Gustino", "10.00 - 11.00", "P002"),
                const SizedBox(
                  height: 10,
                ),
                _buildPatientBox(
                    "Putu Aryasatya Dharma Kenzhie", "15.00 - 16.00", "P003"),
                const SizedBox(
                  height: 10,
                ),
                _buildPatientBox("Shaquille O'neil", "17.00 - 18.00", "P004"),
                const SizedBox(height: 12),
                // CustomElevatedButton(
                //   height: 40,
                //   text: "Add Schedule",
                //   buttonStyle: CustomButtonStyles.buttonBlue,
                //   buttonTextStyle: TextStyles.light_16,
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPatientBox(String name, String time, String code) {
    return GestureDetector(
      onTap: () {
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
                  height: 380,
                  width: 380,
                  child: Column(
                    children: [
                      //Detail Appointment
                      Row(
                        children: [
                          Text(
                            "Detail Appointment",
                            style: TextStyles.bold_24,
                          ),
                          const SizedBox(
                            width: 22,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const FaIcon(
                              FontAwesomeIcons.xmark,
                              color: Colors.white,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      //Patient Name
                      Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text(
                              "Patient Name",
                              style: TextStyles.bold_16,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 120,
                            child: Expanded(
                              child: Text(
                                name,
                                style: TextStyles.light_16,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      //Patient Code
                      Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text(
                              "Patient Code",
                              style: TextStyles.bold_16,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 120,
                            child: Expanded(
                              child: Text(
                                code,
                                style: TextStyles.light_16,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      //Start Time
                      Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text(
                              "Start Time",
                              style: TextStyles.bold_16,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 120,
                            child: Expanded(
                              child: Text(
                                time.substring(0, 5),
                                style: TextStyles.light_16,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      //End Time
                      Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text(
                              "End Time",
                              style: TextStyles.bold_16,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 120,
                            child: Expanded(
                              child: Text(
                                time.substring(time.length - 5),
                                style: TextStyles.light_16,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      //Agenda
                      Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text(
                              "Agenda",
                              style: TextStyles.bold_16,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 120,
                            child: Expanded(
                              child: Text(
                                "Ngobrol santai membahas masa depan yang cerah bersamamu",
                                style: TextStyles.light_16,
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              );
            });
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.darkModeCard,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 120,
              child: Text(
                time,
                style: TextStyles.light_16,
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 190,
              child: Expanded(
                child: Text(
                  name,
                  style: TextStyles.bold_18,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const Icon(
              Icons.navigate_next,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
