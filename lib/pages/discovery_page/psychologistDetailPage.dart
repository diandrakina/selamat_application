import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PsychologistDetailPage extends StatefulWidget {
  const PsychologistDetailPage({super.key});

  @override
  State<PsychologistDetailPage> createState() => _PsychologistDetailPageState();
}

class _PsychologistDetailPageState extends State<PsychologistDetailPage> {
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
                  "Our psychologist",
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
                    image: AssetImage(
                        'assets/images/discovery_page/psikolog/ZhouYiran.jpg'),
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
                    "Dr. Zhou Yiran, S.Kom., M.Cs., M.Hum., Ph.D.",
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
                              Row(
                                children: [
                                  Text(
                                    "Price",
                                    style: TextStyles.bold_30,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 60)),
                                  Text(
                                    "Rp 200.000",
                                    style: TextStyles.bold_30,
                                  ),
                                  Text(
                                    "/session",
                                    style: TextStyles.regular_18,
                                  )
                                ],
                              ),
                              Padding(padding: EdgeInsets.all(10)),
                              Divider(
                                height: 2,
                                color: AppColors.activeCalendar,
                                thickness: 2,
                              ),
                              Padding(padding: EdgeInsets.all(8)),
                              Column(
                                children: [
                                  ProfilePsikolog(
                                    icon: FontAwesomeIcons.graduationCap,
                                    description:
                                        'Hardvard University School of Health',
                                    tittle: 'Alumnus',
                                  ),
                                  Padding(padding: EdgeInsets.all(5)),
                                  ProfilePsikolog(
                                    icon: Icons.work,
                                    description: '23 years',
                                    tittle: 'Experience',
                                  ),
                                  Padding(padding: EdgeInsets.all(5)),
                                  ProfilePsikolog(
                                    icon: FontAwesomeIcons.solidHospital,
                                    description: 'Cedars-Sinai Medical Center',
                                    tittle: 'Work in',
                                  ),
                                  Padding(padding: EdgeInsets.all(5)),
                                  ProfilePsikolog(
                                    icon: FontAwesomeIcons.solidThumbsUp,
                                    description: '555118988995',
                                    tittle: 'Doctor Code',
                                  ),
                                  Padding(padding: EdgeInsets.all(5)),
                                ],
                              ),

                              //DESCRIPTION
                              Padding(padding: EdgeInsets.all(15)),
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
                                "Dr. Zhou Yiran is our recommended psycho-logist, since he studied in harvard and also he study about computer, that make him a great doctor of all time, nobody can defeat him until now.",
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
                                "Very positive, after what he had been through before, he became so reliable person, that every person want him to fix their problem, come and join with Dr Richard Head",
                                style: TextStyles.regular_18,
                              ),

                              //TOMBOL CHAT
                              SizedBox(
                                height: 40,
                              ),
                              Center(
                                child: CustomElevatedButton(
                                  text: "Chat",
                                  textStyle: TextStyles.bold_18,
                                  height: 30,
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
      ),
    );
  }
}

class ProfilePsikolog extends StatefulWidget {
  final IconData icon;
  final String tittle;
  final String description;
  const ProfilePsikolog(
      {Key? key,
      required this.icon,
      required this.description,
      required this.tittle});

  @override
  State<ProfilePsikolog> createState() => _ProfilePsikologState();
}

class _ProfilePsikologState extends State<ProfilePsikolog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 30,
            child: FaIcon(
              widget.icon,
              size: 30,
              color: Colors.white,
            ),
          ),
          Padding(padding: EdgeInsets.all(8)),
          // SizedBox(
          //   width: 10,
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.tittle,
                style: TextStyles.bold_18,
              ),
              Text(
                widget.description,
                style: TextStyles.light_18,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          )
        ],
      ),
    );
  }
}
