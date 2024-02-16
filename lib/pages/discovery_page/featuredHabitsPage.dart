import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class FeaturedHabitsPage extends StatefulWidget {
  const FeaturedHabitsPage({super.key});

  @override
  State<FeaturedHabitsPage> createState() => _FeaturedHabitsPageState();
}

class _FeaturedHabitsPageState extends State<FeaturedHabitsPage> {
  PanelController panelController = PanelController();
  @override
  void initState() {
    super.initState();
  }

  void togglePanel() => panelController.isPanelOpen
      ? panelController.close()
      : panelController.open();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 80,
          leadingWidth: double.maxFinite,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: Container(
            child: Row(
              children: [
                Padding(padding: EdgeInsets.all(5)),
                FaIcon(
                  Icons.arrow_back,
                  color: AppColors.white,
                  size: 25,
                ),
                Padding(padding: EdgeInsets.all(5)),
                Text(
                  "The Art of Thinking",
                  style: TextStyles.bold_30,
                ),
              ],
            ),
          ),
        ),

        body: SlidingUpPanel(
          controller: panelController,
          parallaxEnabled: true,
          maxHeight: 650,
          minHeight: 400,
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/discovery_page/catur.png'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          panelBuilder: (ScrollController controller) {
            return SingleChildScrollView(
              controller: controller,
              child: Column(
                children: [
                  Text(
                    "by Dr. Andreas S.Kom, M.Kom.",
                    style: TextStyles.bold_30,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "4.9",
                        style: TextStyles.regular_18,
                      ),
                      FaIcon(
                        Icons.star,
                        size: 25,
                        color: Colors.yellow,
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Text(
                        "(14,231 reviews)",
                        style: TextStyles.regular_18,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.bgDarkMode,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(38),
                        topRight: Radius.circular(38),
                      ),
                    ),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: togglePanel,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  height: 5,
                                  width: 250,
                                  color: AppColors.white,
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(15)),
                              Text(
                                "Details",
                                style: TextStyles.bold_30,
                              ),
                              Padding(padding: EdgeInsets.all(10)),
                              Divider(
                                height: 2,
                                color: AppColors.activeCalendar,
                                thickness: 2,
                              ),
                              Padding(padding: EdgeInsets.all(8)),
                              Text(
                                "The art of thinking is use for person who needs a mentality improvement, health improvement and be an alpha in their group. All of this  is about mindset, how you thinking.",
                                style: TextStyles.regular_18,
                              ),
                              Padding(padding: EdgeInsets.all(8)),
                              Container(
                                height: 35,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.pastelGreenHealth),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Free",
                                      style: TextStyles.bold_18,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(8)),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.clock,
                                            size: 25,
                                            color: AppColors.white,
                                          ),
                                          Padding(padding: EdgeInsets.all(5)),
                                          Text(
                                            '3 months',
                                            style: TextStyles.regular_18,
                                          ),
                                        ],
                                      ),
                                      Padding(padding: EdgeInsets.all(5)),
                                      Row(
                                        children: [
                                          FaIcon(
                                            Icons.task,
                                            color: Colors.white,
                                          ),
                                          Padding(padding: EdgeInsets.all(5)),
                                          Text(
                                            '400 tasks',
                                            style: TextStyles.regular_18,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.all(16)),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          FaIcon(
                                            Icons.person,
                                            color: Colors.white,
                                          ),
                                          Padding(padding: EdgeInsets.all(5)),
                                          Text(
                                            '762 users',
                                            style: TextStyles.regular_18,
                                          ),
                                        ],
                                      ),
                                      Padding(padding: EdgeInsets.all(5)),
                                      Row(
                                        children: [
                                          FaIcon(
                                            Icons.share,
                                            color: Colors.white,
                                          ),
                                          Padding(padding: EdgeInsets.all(5)),
                                          Text(
                                            '238 shares',
                                            style: TextStyles.regular_18,
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),

                              //DESCRIPTION
                              Padding(padding: EdgeInsets.all(20)),
                              Text(
                                "Description",
                                style: TextStyles.bold_30,
                              ),
                              Padding(padding: EdgeInsets.all(10)),
                              Divider(
                                height: 2,
                                color: AppColors.activeCalendar,
                                thickness: 2,
                              ),
                              Padding(padding: EdgeInsets.all(8)),
                              Text(
                                "Dr. Andreas S.Kom was a master of computer science, he also study psychology, since he study psychology, he became an alpha male",
                                style: TextStyles.regular_18,
                              ),

                              //REVIEWS
                              Padding(padding: EdgeInsets.all(20)),
                              Text(
                                "Reviews",
                                style: TextStyles.bold_30,
                              ),
                              Padding(padding: EdgeInsets.all(10)),
                              Divider(
                                height: 2,
                                color: AppColors.activeCalendar,
                                thickness: 2,
                              ),
                              Padding(padding: EdgeInsets.all(8)),
                              Text(
                                "Very positive, every person on this earth must try this habits, by copying Dr. Andreas habits all of people would be the greatest of all time",
                                style: TextStyles.regular_18,
                              ),

                              //TOMBOL ENROLL
                              SizedBox(
                                height: 40,
                              ),
                              Center(
                                child: CustomElevatedButton(
                                  text: "Enroll Now",
                                  buttonTextStyle: TextStyles.bold_18,
                                  buttonStyle: CustomButtonStyles.buttonBlue2,
                                  height: 40,
                                  width: 150,
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          color: Colors.transparent,
        ),
        // AnimatedPositioned(
        //   duration: Duration(milliseconds: 500),
        //   curve: Curves.easeInOut,
        // ),
      ),
    );
  }
}
