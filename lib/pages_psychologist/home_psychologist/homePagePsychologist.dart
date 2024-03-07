import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';
import 'package:timeline_tile/timeline_tile.dart';

class HomePagePsychologist extends StatefulWidget {
  const HomePagePsychologist({super.key});

  @override
  State<HomePagePsychologist> createState() => _HomePagePsychologistState();
}

class _HomePagePsychologistState extends State<HomePagePsychologist> {
  @override
  int currentStepper = 0;
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //APPBAR
        appBar: AppBar(
          toolbarHeight: 60,
          leadingWidth: double.maxFinite,
          backgroundColor: AppColors.bgDarkMode,
          leading: const Row(
            children: [
              SizedBox(
                width: 300,
              ),
              FaIcon(
                FontAwesomeIcons.solidBell,
                size: 25,
                color: Colors.white,
              ),
              SizedBox(
                width: 20,
              ),
              FaIcon(
                Icons.message,
                size: 25,
                color: Colors.white,
              ),
            ],
          ),
        ),

        //BODY
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(right: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                              'assets/images/discovery_page/psikolog/SongEunseok.jpg'),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome back!",
                              style: TextStyles.medium_18,
                            ),
                            Text(
                              "Song Eunseok, M.Psi.",
                              style: TextStyles.bold_24,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                //Appointment
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildAppoinmentBox(
                          "Richie Hartono",
                          "A32123",
                          "12 Jun 2024, 08.00 am - 09.00 am",
                          'assets/images/home_page/gojosatoru.png'),
                      const SizedBox(
                        width: 20,
                      ),
                      _buildAppoinmentBox(
                          "Richie Hartono",
                          "A32123",
                          "12 Jun 2024, 08.00 am - 09.00 am",
                          'assets/images/home_page/gojosatoru.png'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                //Today's Patient
                Container(
                  height: 400,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: AppColors.darkModeCard,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      const Padding(padding: EdgeInsets.all(5)),
                      Text(
                        "Today's Patient",
                        style: TextStyles.bold_24,
                      ),
                      Text(
                        "Saturday 4 December 2023",
                        style: TextStyles.light_18,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          width: 300,
                          height: 300,
                          child: Center(
                            child: _patientList(context),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),

                //Reschedule Request
                Container(
                  padding: const EdgeInsets.all(15),
                  height: 250,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: AppColors.darkModeCard,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(children: [
                    Text(
                      "Reschedule Request",
                      style: TextStyles.bold_24,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        _rescheduleRequest(
                            "Abraham Mahayana Setiawan",
                            "P001",
                            "09.00 - 11.00",
                            "12.00 - 13.00",
                            "Saturday, 4 December 2023",
                            "Sunday, 5 December 2024"),
                        const SizedBox(
                          height: 10,
                        ),
                        _rescheduleRequest(
                            "Abraham Mahayana Setiawan",
                            "P001",
                            "09.00 - 11.00",
                            "12.00 - 13.00",
                            "Saturday, 4 December 2023",
                            "Sunday, 5 December 2024"),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),

                //Tambahin diagram kalau sempet
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _rescheduleRequest(String name, String code, String oldTime,
      String newTime, String oldDate, String newDate) {
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
                            "Detail Reschedule",
                            style: TextStyles.bold_24,
                          ),
                          const SizedBox(
                            width: 40,
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

                      //Old Date
                      Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text(
                              "Old Date",
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
                                oldDate,
                                style: TextStyles.light_16,
                                maxLines: 2,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      //Old Time
                      Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text(
                              "Old Time",
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
                                oldTime,
                                style: TextStyles.light_16,
                                maxLines: 2,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      //New Date
                      Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text(
                              "New Date",
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
                                newDate,
                                style: TextStyles.light_16,
                                maxLines: 2,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      //New Time
                      Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text(
                              "New Time",
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
                                newTime,
                                style: TextStyles.light_16,
                                maxLines: 2,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      //TOMBOL
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //Accepted
                          CustomElevatedButton(
                            height: 40,
                            width: 120,
                            text: "Accepted",
                            buttonStyle: CustomButtonStyles.buttonBlue2,
                            buttonTextStyle: TextStyles.bold_16,
                          ),

                          //Rejected
                          CustomElevatedButton(
                            height: 40,
                            width: 120,
                            text: "Rejected",
                            buttonStyle: CustomButtonStyles.buttonGrey3,
                            buttonTextStyle: TextStyles.bold_16,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            });
      },
      child: Container(
        height: 60,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: AppColors.inactiveCalendar,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 60,
              child: Text(
                code,
                style: TextStyles.light_16,
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 220,
              child: Text(
                name,
                style: TextStyles.bold_18,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const FaIcon(
              Icons.navigate_next,
              color: Colors.white,
              size: 30,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAppoinmentBox(
      String name, String code, String time, String image) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 350,
          decoration: const BoxDecoration(
            color: AppColors.floatingGrey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Appointment request",
                      style: TextStyles.medium_14,
                    ),
                    Text(
                      time,
                      style: TextStyles.bold_16,
                    )
                  ],
                ),
                const SizedBox(
                  width: 60,
                ),
                const FaIcon(
                  FontAwesomeIcons.arrowRight,
                  color: Colors.white,
                  size: 15,
                )
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          height: 140,
          width: 350,
          decoration: const BoxDecoration(
            color: AppColors.darkModeCard,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(image),
                radius: 40,
              ),
              const SizedBox(
                width: 10,
              ),

              //ISI : Nama sampai tombol
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyles.bold_24,
                  ),
                  Text(
                    "Code : ${code}",
                    style: TextStyles.medium_18,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      CustomElevatedButton(
                        text: "ACCEPT",
                        height: 30,
                        width: 110,
                        buttonStyle: CustomButtonStyles.buttonBlue,
                        buttonTextStyle: TextStyles.bold_16,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CustomElevatedButton(
                        text: "DECLINE",
                        height: 30,
                        width: 120,
                        buttonStyle: CustomButtonStyles.buttonNotSure,
                        buttonTextStyle: TextStyles.bold_16,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _patientList(BuildContext context) {
    return Center(
      child: ListView(
        children: const [
          PatientList(
              isFirst: true,
              isLast: false,
              isPast: false,
              name: "Richie Hartono",
              time: "08.00 - 09.00"),
          PatientList(
              isFirst: false,
              isLast: false,
              isPast: true,
              name: "Abraham Mahayana Setiawan",
              time: "09.00 - 10.00"),
          PatientList(
              isFirst: false,
              isLast: false,
              isPast: true,
              name: "Ariya Gunananda",
              time: "10.00 - 11.00"),
          PatientList(
              isFirst: false,
              isLast: false,
              isPast: true,
              name: "Dexter Valerian Krisnadhi",
              time: "11.00 - 12.00"),
          PatientList(
              isFirst: false,
              isLast: false,
              isPast: true,
              name: "Nathasya Rizandi",
              time: "15.00 - 17.00"),
          PatientList(
              isFirst: false,
              isLast: true,
              isPast: true,
              name: "Shaquille O'neil",
              time: "17.00 - 18.00"),
        ],
      ),
    );
  }
}

class PatientList extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;

  final String time;
  final String name;
  const PatientList(
      {super.key,
      required this.isFirst,
      required this.isLast,
      required this.isPast,
      required this.time,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle:
            const LineStyle(color: AppColors.baseColor, thickness: 2),
        indicatorStyle:
            const IndicatorStyle(width: 20, color: AppColors.baseColor),
        endChild: Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            Text(
              time,
              style: TextStyles.bold_16,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                name,
                style: TextStyles.bold_18,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
