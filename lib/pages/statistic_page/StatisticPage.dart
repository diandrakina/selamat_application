import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/chart/profile_page/timeChart.dart';
import 'package:selamat_application/widget/drawerWidget.dart';
import 'package:selamat_application/widget/navbar.dart';
import 'package:selamat_application/widget/searchBar.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({super.key});

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  String dropdownValue = 'Week';

  @override
  Widget build(BuildContext context) {
    List<double> dailyTime = [1, 3, 0.5, 2, 1.5, 0, 0];
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        //APP BAR
        appBar: AppBar(
          toolbarHeight: 80,
          leadingWidth: double.maxFinite,
          leading: Builder(builder: (context) {
            return Container(
              color: AppColors.bgDarkMode,
              padding: const EdgeInsets.only(left: 20, right: 15),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/discovery_page/psikolog/ChenZheyuan.jpg"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const CustomSearchBar2(
                    width: 270,
                    height: 37.5,
                    color: AppColors.floatingGrey,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const FaIcon(
                    FontAwesomeIcons.solidCommentDots,
                    size: 25,
                    color: AppColors.white,
                  ),
                ],
              ),
            );
          }),
        ),

        //DRAWER
        drawer: const DrawerWidget(),

        //BODY
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    //OVERTIME
                    SizedBox(
                      width: 260,
                      child: Text(
                        "Overtime",
                        style: TextStyles.bold_24,
                      ),
                    ),
                    DropdownButton<String>(
                      value: dropdownValue,
                      dropdownColor: AppColors.activeCalendar,
                      icon: const Icon(Icons.arrow_drop_down),
                      style: TextStyles.regular_18,
                      items: const [
                        DropdownMenuItem<String>(
                          value: "Week",
                          child: Text("Week"),
                        ),
                        DropdownMenuItem<String>(
                          value: "Month",
                          child: Text("Month"),
                        ),
                        DropdownMenuItem<String>(
                          value: "Year",
                          child: Text("Year"),
                        ),
                      ],
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                    ),
                  ],
                ),
                const Divider(
                  height: 30,
                  color: AppColors.activeCalendar,
                  thickness: 2,
                ),

                //OVERTIME HOURS
                SizedBox(
                  height: 30,
                  child: Text(
                    "Overtime hours",
                    style: TextStyles.bold_18,
                  ),
                ),
                Text(
                  "Total",
                  style: TextStyles.medium_14,
                ),
                Center(
                  child: Text(
                    "02:49:57",
                    style: TextStyles.bold_30,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                //OVERTIME TARGET
                SizedBox(
                  height: 30,
                  child: Text(
                    "Overtime target",
                    style: TextStyles.bold_18,
                  ),
                ),
                Text(
                  "Total",
                  style: TextStyles.medium_14,
                ),
                Center(
                  child: Text(
                    "3/12 hrs",
                    style: TextStyles.bold_30,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                //OVERTIME DISTRIBUTION
                SizedBox(
                  height: 50,
                  child: Text(
                    "Overtime distribution",
                    style: TextStyles.bold_18,
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: TimeChart(
                      dailyTime: dailyTime, color: AppColors.baseColor),
                ),
                const SizedBox(
                  height: 30,
                ),

                //LEISURE
                Text(
                  "Leisure",
                  style: TextStyles.bold_24,
                ),
                const Divider(
                  height: 30,
                  color: AppColors.activeCalendar,
                  thickness: 2,
                ),

                //LEISURE HOURS
                SizedBox(
                  height: 30,
                  child: Text(
                    "Leisure hours",
                    style: TextStyles.bold_18,
                  ),
                ),
                Text(
                  "Total",
                  style: TextStyles.medium_14,
                ),
                Center(
                  child: Text(
                    "08:14:01",
                    style: TextStyles.bold_30,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                //LEISURE TARGET
                SizedBox(
                  height: 30,
                  child: Text(
                    "Leisure target",
                    style: TextStyles.bold_18,
                  ),
                ),
                Text(
                  "Total",
                  style: TextStyles.medium_14,
                ),
                Center(
                  child: Text(
                    "8/16 hrs",
                    style: TextStyles.bold_30,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                //LEISURE DISTRIBUTION
                SizedBox(
                  height: 50,
                  child: Text(
                    "Leisure distribution",
                    style: TextStyles.bold_18,
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: TimeChart(
                      dailyTime: dailyTime, color: AppColors.pastelGreenHealth),
                ),
                const SizedBox(
                  height: 30,
                ),

                //ENTERTAIN
                Text(
                  "Entertainment",
                  style: TextStyles.bold_24,
                ),
                const Divider(
                  height: 30,
                  color: AppColors.activeCalendar,
                  thickness: 2,
                ),

                //LEISURE HOURS
                SizedBox(
                  height: 30,
                  child: Text(
                    "Sleep Time",
                    style: TextStyles.bold_18,
                  ),
                ),
                Text(
                  "Total",
                  style: TextStyles.medium_14,
                ),
                Center(
                  child: Text(
                    "38:09:26",
                    style: TextStyles.bold_30,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                //ENTERTAIN TARGET
                SizedBox(
                  height: 30,
                  child: Text(
                    "Sleep Time Target",
                    style: TextStyles.bold_18,
                  ),
                ),
                Text(
                  "Total",
                  style: TextStyles.medium_14,
                ),
                Center(
                  child: Text(
                    "38/56 hrs",
                    style: TextStyles.bold_30,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                //ENTERTAIN DISTRIBUTION
                SizedBox(
                  height: 50,
                  child: Text(
                    "Sleep Time distribution",
                    style: TextStyles.bold_18,
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: TimeChart(
                      dailyTime: dailyTime, color: AppColors.purplePastel),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),

        //BOTTOM NAVBAR
        bottomNavigationBar: const NavBar2(),
      ),
    );
  }
}
