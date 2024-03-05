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
                )

                //Tambahin diagram kalau sempet
              ],
            ),
          ),
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
              name: "Richie Hartono",
              time: "08.00 - 09.00"),
          PatientList(
              isFirst: false,
              isLast: false,
              isPast: true,
              name: "Richie Hartono",
              time: "08.00 - 09.00"),
          PatientList(
              isFirst: false,
              isLast: false,
              isPast: true,
              name: "Richie Hartono",
              time: "08.00 - 09.00"),
          PatientList(
              isFirst: false,
              isLast: false,
              isPast: true,
              name: "Richie Hartono",
              time: "08.00 - 09.00"),
          PatientList(
              isFirst: false,
              isLast: true,
              isPast: true,
              name: "Richie Hartono",
              time: "08.00 - 09.00"),
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
            Text(
              name,
              style: TextStyles.bold_18,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
